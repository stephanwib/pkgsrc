# $NetBSD: buildlink3.mk,v 1.27 2012/03/03 00:12:13 wiz Exp $

BUILDLINK_TREE+=	wv

.if !defined(WV_BUILDLINK3_MK)
WV_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.wv+=	wv>=1.0.0
BUILDLINK_ABI_DEPENDS.wv+=	wv>=1.2.9nb5
BUILDLINK_PKGSRCDIR.wv?=	../../converters/wv

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libgsf/buildlink3.mk"
.include "../../graphics/libwmf/buildlink3.mk"
.endif # WV_BUILDLINK3_MK

BUILDLINK_TREE+=	-wv
