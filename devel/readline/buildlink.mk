# $NetBSD: buildlink.mk,v 1.11 2001/06/20 23:24:39 jlam Exp $
#
# This Makefile fragment is included by packages that use readline().
#
# To use this Makefile fragment, simply:
#
# (1) Optionally define USE_GNU_READLINE to force use of GNU readline.
# (2) Optionally define READLINE_REQD to the version of GNU readline desired.
# (3) Add ${BUILDLINK_DIR}/include to the front of the C preprocessor's header
#     search path, and
# (4) Add ${BUILDLINK_DIR}/lib to the front of the linker's library search
#     path.
#
# NOTE:	You may need to do some more work to get libedit recognized over
#	libreadline, especially by GNU configure scripts.

.if !defined(READLINE_BUILDLINK_MK)
READLINE_BUILDLINK_MK=	# defined

READLINE_REQD?=		2.2

.if defined(USE_GNU_READLINE)
_NEED_GNU_READLINE=	YES
.elif exists(/usr/include/readline.h) || \
      exists(/usr/include/readline/readline.h)
_NEED_GNU_READLINE=	NO
.else
_NEED_GNU_READLINE=	YES
.endif

.if ${_NEED_GNU_READLINE} == "YES"
DEPENDS+=			readline>=${READLINE_REQD}:../../devel/readline
BUILDLINK_PREFIX.readline=	${LOCALBASE}
BUILDLINK_FILES.readline=	include/readline/*
BUILDLINK_FILES.readline+=	lib/libreadline.*

BUILDLINK_PREFIX.history=	${LOCALBASE}
BUILDLINK_FILES.history+=	lib/libhistory.*
.else
.if exists(/usr/include/readline.h)
BUILDLINK_PREFIX.readline=	/usr
BUILDLINK_FILES.readline=	include/readline.h
BUILDLINK_FILES.readline+=	lib/libedit.*
BUILDLINK_TRANSFORM.readline=	-e "s|/readline.h|/readline/readline.h|g"
BUILDLINK_TRANSFORM.readline+=	-e "s|libedit|libreadline|g"

BUILDLINK_PREFIX.history=	/usr
BUILDLINK_FILES.history=	include/history.h
BUILDLINK_FILES.history+=	lib/libedit.*
BUILDLINK_TRANSFORM.history=	-e "s|/history.h|/readline/history.h|g"
BUILDLINK_TRANSFORM.history+=	-e "s|libedit|libhistory|g"
.else # exists(/usr/include/readline/readline.h)
BUILDLINK_PREFIX.readline=	/usr
BUILDLINK_FILES.readline=	include/readline/*
BUILDLINK_FILES.readline+=	lib/libedit.*
BUILDLINK_TRANSFORM.readline=	-e "s|libedit|libreadline|g"

BUILDLINK_PREFIX.history=	/usr
BUILDLINK_FILES.history+=	lib/libedit.*
BUILDLINK_TRANSFORM.history=	-e "s|libedit|libhistory|g"
.endif
.endif

BUILDLINK_TARGETS.readline=	# empty
BUILDLINK_TARGETS.readline+=	readline-buildlink
BUILDLINK_TARGETS.readline+=	history-buildlink
BUILDLINK_TARGETS+=		${BUILDLINK_TARGETS.readline}

pre-configure: ${BUILDLINK_TARGETS.readline}
readline-buildlink: _BUILDLINK_USE
history-buildlink: _BUILDLINK_USE

.include "../../mk/bsd.buildlink.mk"

.endif	# READLINE_BUILDLINK_MK
