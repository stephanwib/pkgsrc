# $NetBSD: buildlink3.mk,v 1.19 2018/03/12 11:15:58 wiz Exp $

BUILDLINK_TREE+=	vte029

.if !defined(VTE029_BUILDLINK3_MK)
VTE029_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.vte029+=	vte029>=0.32.2<0.38
BUILDLINK_ABI_DEPENDS.vte029+=	vte029>=0.32.2nb18
BUILDLINK_PKGSRCDIR.vte029?=	../../x11/vte029

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/termcap.buildlink3.mk"
.endif # VTE029_BUILDLINK3_MK

BUILDLINK_TREE+=	-vte029
