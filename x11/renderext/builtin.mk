# $NetBSD: builtin.mk,v 1.3 2006/04/06 06:23:03 reed Exp $

BUILTIN_PKG:=	renderext

BUILTIN_FIND_FILES_VAR:=	H_RENDER
BUILTIN_FIND_FILES.H_RENDER=	${X11BASE}/include/X11/extensions/render.h

.include "../../mk/buildlink3/bsd.builtin.mk"

###
### Determine if there is a built-in implementation of the package and
### set IS_BUILTIN.<pkg> appropriately ("yes" or "no").
###
.if !defined(IS_BUILTIN.renderext)
IS_BUILTIN.renderext=	no
#
# Here, we skip checking whether the files are under ${LOCALBASE} since
# we'll consider this X11 package to be built-in even if it's a part
# of one of the pkgsrc-installed X11 distributions.
#  
.  if empty(H_RENDER:M__nonexistent__)
IS_BUILTIN.renderext=	yes
.  endif
.endif
MAKEVARS+=      IS_BUILTIN.renderext

###
### If there is a built-in implementation, then set BUILTIN_PKG.<pkg> to
### a package name to represent the built-in package.
###
.if !defined(BUILTIN_PKG.renderext) && \
    !empty(IS_BUILTIN.renderext:M[yY][eE][sS]) && \
    empty(H_RENDER:M__nonexistent__)
BUILTIN_VERSION.renderext!=						\
	${AWK} '/\#define[ 	]*RENDER_MAJOR/ { M = $$3 }		\
		/\#define[ 	]*RENDER_MINOR/ { m = "."$$3 }		\
		END { printf "%s%s\n", M, m }'				\
		${H_RENDER}
BUILTIN_PKG.renderext=	renderext-${BUILTIN_VERSION.renderext}
.endif
MAKEVARS+=	BUILTIN_PKG.renderext

###
### Determine whether we should use the built-in implementation if it
### exists, and set USE_BUILTIN.<pkg> appropriate ("yes" or "no").
###
.if !defined(USE_BUILTIN.renderext)
.  if ${PREFER.renderext} == "pkgsrc"
USE_BUILTIN.renderext=	no
.  else
USE_BUILTIN.renderext=	${IS_BUILTIN.renderext}
.    if defined(BUILTIN_PKG.renderext) && \
        !empty(IS_BUILTIN.renderext:M[yY][eE][sS])
USE_BUILTIN.renderext=	yes
.      for _dep_ in ${BUILDLINK_API_DEPENDS.renderext}
.        if !empty(USE_BUILTIN.renderext:M[yY][eE][sS])
USE_BUILTIN.renderext!=							\
	if ${PKG_ADMIN} pmatch ${_dep_:Q} ${BUILTIN_PKG.renderext:Q}; then \
		${ECHO} yes;						\
	else								\
		${ECHO} no;						\
	fi
.        endif
.      endfor
.    endif
.  endif  # PREFER.renderext
.endif
MAKEVARS+=	USE_BUILTIN.renderext

###
### The section below only applies if we are not including this file
### solely to determine whether a built-in implementation exists.
###
CHECK_BUILTIN.renderext?=	no
.if !empty(CHECK_BUILTIN.renderext:M[nN][oO])

.  if !empty(USE_BUILTIN.renderext:M[nN][oO])
BUILDLINK_API_DEPENDS.renderext+=	renderext>=0.9
.  endif

.  if !empty(USE_BUILTIN.renderext:M[yY][eE][sS])
BUILDLINK_PREFIX.renderext=	${X11BASE}
.    include "../../mk/x11.buildlink3.mk"
.    include "../../mk/x11.builtin.mk"
.  endif

.endif	# CHECK_BUILTIN.renderext
