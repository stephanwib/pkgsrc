# $NetBSD: buildlink3.mk,v 1.4 2016/10/07 18:25:31 adam Exp $

BUILDLINK_TREE+=	eio

.if !defined(EIO_BUILDLINK3_MK)
EIO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.eio+=	eio>=1.7.7
BUILDLINK_ABI_DEPENDS.eio?=	eio>=1.7.7nb3
BUILDLINK_PKGSRCDIR.eio?=	../../devel/eio

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/eet/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../x11/libXScrnSaver/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXp/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.endif # EIO_BUILDLINK3_MK

BUILDLINK_TREE+=	-eio
