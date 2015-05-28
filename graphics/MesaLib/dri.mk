# $NetBSD: dri.mk,v 1.9 2015/05/28 21:09:07 tnn Exp $
#
# Currently, this is for convenience only.
#
.if !defined(DRI_MK)
DRI_MK=		# defined

.  if !defined(USE_BUILTIN.MesaLib)
CHECK_BUILTIN.MesaLib:=	yes
.    include "../../graphics/MesaLib/builtin.mk"
CHECK_BUILTIN.MesaLib:=	no
.  endif

.  if !empty(USE_BUILTIN.MesaLib:M[Nn][Oo])
BUILDLINK_API_DEPENDS.dri2proto+=	dri2proto>=2.1
BUILDLINK_API_DEPENDS.glproto+=		glproto>=1.4.11
BUILDLINK_API_DEPENDS.libdrm+=		libdrm>=2.4.24
.  endif
.  include "../../textproc/expat/buildlink3.mk"
.  include "../../x11/dri2proto/buildlink3.mk"
.  include "../../x11/glproto/buildlink3.mk"
.  include "../../x11/libXdamage/buildlink3.mk"
.  include "../../x11/libXfixes/buildlink3.mk"
.  include "../../x11/libdrm/buildlink3.mk"
.  include "../../x11/libXxf86vm/buildlink3.mk"
.  include "../../x11/xf86driproto/buildlink3.mk"
.  include "../../x11/xf86vidmodeproto/buildlink3.mk"
# Linux supports dri3
.  if ${OPSYS} == "Linux"
.  include "../../x11/dri3proto/buildlink3.mk"
.  include "../../x11/presentproto/buildlink3.mk"
.  include "../../x11/libxshmfence/buildlink3.mk"
.  endif
.endif
