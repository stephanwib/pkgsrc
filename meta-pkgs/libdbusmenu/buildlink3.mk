# $NetBSD: buildlink3.mk,v 1.6 2018/03/12 11:15:39 wiz Exp $

BUILDLINK_TREE+=	libdbusmenu

.if !defined(LIBDBUSMENU_BUILDLINK3_MK)
LIBDBUSMENU_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libdbusmenu+=	libdbusmenu>=12.10.2
BUILDLINK_ABI_DEPENDS.libdbusmenu?=	libdbusmenu>=12.10.2nb5
BUILDLINK_PKGSRCDIR.libdbusmenu?=	../../meta-pkgs/libdbusmenu

.include "../../textproc/libxslt/buildlink3.mk"
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../textproc/json-glib/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../devel/atk/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/gnome-doc-utils/buildlink3.mk"
.endif	# LIBDBUSMENU_BUILDLINK3_MK

BUILDLINK_TREE+=	-libdbusmenu
