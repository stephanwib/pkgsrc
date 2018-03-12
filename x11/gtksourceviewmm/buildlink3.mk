# $NetBSD: buildlink3.mk,v 1.12 2018/03/12 11:15:51 wiz Exp $

BUILDLINK_TREE+=	gtksourceviewmm

.if !defined(GTKSOURCEVIEWMM_BUILDLINK3_MK)
GTKSOURCEVIEWMM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtksourceviewmm+=	gtksourceviewmm>=3.2.0
BUILDLINK_ABI_DEPENDS.gtksourceviewmm?=	gtksourceviewmm>=3.2.0nb14
BUILDLINK_PKGSRCDIR.gtksourceviewmm?=	../../x11/gtksourceviewmm

.include "../../devel/atkmm/buildlink3.mk"
.include "../../graphics/cairomm/buildlink3.mk"
.include "../../devel/glibmm/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/pangomm/buildlink3.mk"
.include "../../devel/libsigc++/buildlink3.mk"
.include "../../x11/gtkmm3/buildlink3.mk"
.include "../../x11/gtksourceview3/buildlink3.mk"
.endif	# GTKSOURCEVIEWMM_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtksourceviewmm
