# $NetBSD: buildlink3.mk,v 1.28 2018/03/12 11:15:44 wiz Exp $

BUILDLINK_TREE+=	polkit-qt

.if !defined(POLKIT_QT_BUILDLINK3_MK)
POLKIT_QT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.polkit-qt+=	polkit-qt>=0.9.2
BUILDLINK_ABI_DEPENDS.polkit-qt+=	polkit-qt>=0.112.0nb1
BUILDLINK_PKGSRCDIR.polkit-qt?=		../../security/polkit-qt

.include "../../security/polkit/buildlink3.mk"
.include "../../x11/qt4-libs/buildlink3.mk"
.endif	# POLKIT_QT_BUILDLINK3_MK

BUILDLINK_TREE+=	-polkit-qt
