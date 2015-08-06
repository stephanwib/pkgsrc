$NetBSD: patch-gcc_config_host-netbsd.c,v 1.1 2015/08/06 07:21:29 martin Exp $

Add host hooks for NetBSD - needed for working precompiled headers.
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58397

--- /dev/null	2013-09-11 20:06:51.000000000 +0200
+++ gcc/config/host-netbsd.c	2013-09-11 20:29:31.000000000 +0200
@@ -0,0 +1,85 @@
+/* NetBSD host-specific hook definitions.
+   Copyright (C) 2004-2013 Free Software Foundation, Inc.
+
+   This file is part of GCC.
+
+   GCC is free software; you can redistribute it and/or modify it
+   under the terms of the GNU General Public License as published
+   by the Free Software Foundation; either version 3, or (at your
+   option) any later version.
+
+   GCC is distributed in the hope that it will be useful, but WITHOUT
+   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
+   License for more details.
+
+   You should have received a copy of the GNU General Public License
+   along with GCC; see the file COPYING3.  If not see
+   <http://www.gnu.org/licenses/>.  */
+
+#include "config.h"
+#include "system.h"
+#include "coretypes.h"
+#include "hosthooks.h"
+#include "hosthooks-def.h"
+
+
+#undef HOST_HOOKS_GT_PCH_GET_ADDRESS
+#define HOST_HOOKS_GT_PCH_GET_ADDRESS netbsd_gt_pch_get_address
+#undef HOST_HOOKS_GT_PCH_USE_ADDRESS
+#define HOST_HOOKS_GT_PCH_USE_ADDRESS netbsd_gt_pch_use_address
+
+/* For various ports, try to guess a fixed spot in the vm space
+   that's probably free.  */
+#if defined(__sparc64__)
+# define TRY_EMPTY_VM_SPACE	0x40000000000
+#elif defined(_LP64)
+# define TRY_EMPTY_VM_SPACE	0x400000000000
+#elif defined(__mips__) || defined(__vax__) || defined (__arm__)
+# define TRY_EMPTY_VM_SPACE	0x60000000
+#else
+# define TRY_EMPTY_VM_SPACE	0xb0000000
+#endif
+
+/* Determine a location where we might be able to reliably allocate
+   SIZE bytes.  FD is the PCH file, though we should return with the
+   file unmapped.  */
+
+static void *
+netbsd_gt_pch_get_address (size_t size, int fd)
+{
+  void *addr;
+
+  addr = mmap ((void *) TRY_EMPTY_VM_SPACE, size, PROT_READ | PROT_WRITE,
+	       MAP_PRIVATE | MAP_FIXED, fd, 0);
+
+  /* If we failed the map, that means there's *no* free space.  */
+  if (addr == (void *) MAP_FAILED)
+    return NULL;
+  /* Unmap the area before returning.  */
+  munmap (addr, size);
+
+  return addr;
+}
+
+/* Map SIZE bytes of FD+OFFSET at BASE.  Return 1 if we succeeded at 
+   mapping the data at BASE, -1 if we couldn't.  */
+
+static int
+netbsd_gt_pch_use_address (void *base, size_t size, int fd, size_t offset)
+{
+  void *addr;
+
+  /* We're called with size == 0 if we're not planning to load a PCH
+     file at all.  This allows the hook to free any static space that
+     we might have allocated at link time.  */
+  if (size == 0)
+    return -1;
+
+  addr = mmap (base, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_FIXED, fd, offset);
+
+  return addr == base ? 1 : -1;
+}
+
+
+const struct host_hooks host_hooks = HOST_HOOKS_INITIALIZER;
