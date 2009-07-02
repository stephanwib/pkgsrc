# $NetBSD: buildlink3.mk,v 1.18 2009/07/02 10:18:46 wiz Exp $

BUILDLINK_TREE+=	loudmouth

.if !defined(LOUDMOUTH_BUILDLINK3_MK)
LOUDMOUTH_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.loudmouth+=	loudmouth>=1.0
BUILDLINK_ABI_DEPENDS.loudmouth+=	loudmouth>=1.2.3nb1
BUILDLINK_PKGSRCDIR.loudmouth?=	../../chat/loudmouth

.include "../../devel/glib2/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.endif # LOUDMOUTH_BUILDLINK3_MK

BUILDLINK_TREE+=	-loudmouth
