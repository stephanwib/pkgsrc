# $NetBSD: buildlink3.mk,v 1.7 2018/03/12 11:15:35 wiz Exp $

BUILDLINK_TREE+=	girara

.if !defined(GIRARA_BUILDLINK3_MK)
GIRARA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.girara+=	girara>=0.2.8
BUILDLINK_ABI_DEPENDS.girara?=	girara>=0.2.8nb1
BUILDLINK_PKGSRCDIR.girara?=	../../graphics/girara

.include "../../x11/gtk3/buildlink3.mk"
.endif # GIRARA_BUILDLINK3_MK

BUILDLINK_TREE+=	-girara
