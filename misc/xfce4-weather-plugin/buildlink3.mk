# $NetBSD: buildlink3.mk,v 1.7 2006/04/06 06:22:24 reed Exp $

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
XFCE4_WEATHER_PLUGIN_BUILDLINK3_MK:=	${XFCE4_WEATHER_PLUGIN_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xfce4-weather-plugin
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-weather-plugin}
BUILDLINK_PACKAGES+=	xfce4-weather-plugin

.if !empty(XFCE4_WEATHER_PLUGIN_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.xfce4-weather-plugin+=	xfce4-weather-plugin>=0.4.9
BUILDLINK_ABI_DEPENDS.xfce4-weather-plugin?=	xfce4-weather-plugin>=0.4.9nb2
BUILDLINK_PKGSRCDIR.xfce4-weather-plugin?=	../../misc/xfce4-weather-plugin
.endif	# XFCE4_WEATHER_PLUGIN_BUILDLINK3_MK

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
