# $NetBSD: buildlink3.mk,v 1.9 2011/04/22 13:42:37 obache Exp $

BUILDLINK_TREE+=	phonon

.if !defined(PHONON_BUILDLINK3_MK)
PHONON_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.phonon+=	phonon>=4.1.83
BUILDLINK_ABI_DEPENDS.phonon?=	phonon>=4.4.2nb3
BUILDLINK_PKGSRCDIR.phonon?=	../../multimedia/phonon

.include "../../x11/qt4-libs/buildlink3.mk"
.include "../../x11/qt4-qdbus/buildlink3.mk"
.endif # PHONON_BUILDLINK3_MK

BUILDLINK_TREE+=	-phonon
