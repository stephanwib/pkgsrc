# $NetBSD: buildlink3.mk,v 1.13 2006/04/06 06:23:04 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
XFCE4_PANEL_BUILDLINK3_MK:=	${XFCE4_PANEL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xfce4-panel
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-panel}
BUILDLINK_PACKAGES+=	xfce4-panel

.if !empty(XFCE4_PANEL_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.xfce4-panel+=	xfce4-panel>=4.2.3
BUILDLINK_ABI_DEPENDS.xfce4-panel?=	xfce4-panel>=4.2.3nb2
BUILDLINK_PKGSRCDIR.xfce4-panel?=	../../x11/xfce4-panel
.endif	# XFCE4_PANEL_BUILDLINK3_MK

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/xfce4-mcs-plugins/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
