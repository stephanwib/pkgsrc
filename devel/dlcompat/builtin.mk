# $NetBSD: builtin.mk,v 1.1 2004/07/18 09:35:08 schmonz Exp $

.if !defined(_BLNK_LIBDL_FOUND)
_BLNK_LIBDL_FOUND!=	\
	if [ "`${ECHO} /usr/lib/libdl.*`" = "/usr/lib/libdl.*" ]; then \
		${ECHO} "no";						\
	else								\
		${ECHO} "yes";						\
	fi
BUILDLINK_VARS+=	_BLNK_LIBDL_FOUND
.endif

_DL_H=	/usr/include/dlfcn.h

.if !defined(IS_BUILTIN.dlcompat)
IS_BUILTIN.dlcompat=	no
.  if !empty(_BLNK_LIBDL_FOUND:M[yY][eE][sS])
IS_BUILTIN.dlcompat=	yes
.  elif exists(${_DL_H})
IS_BUILTIN.dlcompat=	yes
.    if !empty(IS_BUILTIN.dlcompat:M[yY][eE][sS])
_DL_VERSION=		20030629
BUILTIN_PKG.dlcompat=	dlcompat-${_DL_VERSION}
BUILDLINK_VARS+=	BUILTIN_PKG.dlcompat
.    endif
.  endif
BUILDLINK_VARS+=	IS_BUILTIN.dlcompat
.endif	# IS_BUILTIN.dlcompat

.if !defined(USE_BUILTIN.dlcompat)
USE_BUILTIN.dlcompat?=	${IS_BUILTIN.dlcompat}
PREFER.dlcompat?=	pkgsrc

.  if defined(BUILTIN_PKG.dlcompat)
USE_BUILTIN.dlcompat=	yes
.    for _depend_ in ${BUILDLINK_DEPENDS.dlcompat}
.      if !empty(IS_BUILTIN.dlcompat:M[yY][eE][sS])
USE_BUILTIN.dlcompat!=							\
	if ${PKG_ADMIN} pmatch '${_depend_}' ${BUILTIN_PKG.dlcompat}; then \
		${ECHO} "yes";						\
	else								\
		${ECHO} "no";						\
	fi
.      endif
.    endfor
.  endif

.  if ${PREFER.dlcompat} == "native"
USE_BUILTIN.dlcompat=	yes
.  endif

.  if !empty(IS_BUILTIN.dlcompat:M[nN][oO]) || \
      (${PREFER.dlcompat} == "pkgsrc")
USE_BUILTIN.dlcompat=	no
.  endif
.endif	# USE_BUILTIN.dlcompat
