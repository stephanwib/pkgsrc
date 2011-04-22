# $NetBSD: buildlink3.mk,v 1.19 2011/04/22 13:42:06 obache Exp $

BUILDLINK_TREE+=	gtk

.if !defined(GTK_BUILDLINK3_MK)
GTK_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtk+=		gtk+>=1.2.10
BUILDLINK_ABI_DEPENDS.gtk+=	gtk+>=1.2.10nb10
BUILDLINK_PKGSRCDIR.gtk?=	../../x11/gtk

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.endif # GTK_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtk
