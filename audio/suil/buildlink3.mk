# $NetBSD: buildlink3.mk,v 1.26 2024/10/20 14:03:26 wiz Exp $

BUILDLINK_TREE+=	suil

.if !defined(SUIL_BUILDLINK3_MK)
SUIL_BUILDLINK3_MK:=

BUILDLINK_ABI_DEPENDS.suil+=	suil>=0.10.12nb12
BUILDLINK_API_DEPENDS.suil+=	suil>=0.8.2
BUILDLINK_PKGSRCDIR.suil?=	../../audio/suil

.include "../../audio/lv2/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif	# SUIL_BUILDLINK3_MK

BUILDLINK_TREE+=	-suil
