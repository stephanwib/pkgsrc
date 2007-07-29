/* $NetBSD: bsd-fflush.c,v 1.1 2007/07/29 14:36:46 joerg Exp $ */

/*-
 * Copyright (c) 2007 Joerg Sonnenberger <joerg@NetBSD.org>.
 * All rights reserved.
 *
 * This code was developed as part of Google's Summer of Code 2007 program.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
 * COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */
 
#include <errno.h>
#include <stdio.h>
#include <unistd.h>

#undef fflush

int
rpl_fflush(FILE *fp)
{
#if defined(__DragonFly__)
	struct __FILE_public *fp_ = (struct __FILE_public *)fp;
#else
#define	fp_ fp
#endif
	off_t pos;

	/* NULL pointer or writeable stream: use normal fflush. */
	if (fp == NULL || (fp_->_flags & (__SWR | __SRW)) != 0)
		return fflush(fp);

	/* Get current position, possibly different from file pointer. */
	pos = ftello(fp);
	if (pos == -1) {
		errno = EBADF;
		return -1;
	}
	/* Purge buffers. */
	if (fpurge(fp) == EOF)
		return -1;

	/*
	 * Disable seek optimisation.  This is forces the following
	 * fseeko to seek the actual position and not realign
	 * the file pointer on a block boundary.
	 */
	fp_->_flags |= __SNPT;

	return fseeko(fp, pos, SEEK_SET);
}
