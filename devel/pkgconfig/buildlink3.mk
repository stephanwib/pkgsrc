# $NetBSD: buildlink3.mk,v 1.4 2004/01/24 03:26:46 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PKGCONFIG_BUILDLINK3_MK:=	${PKGCONFIG_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pkgconfig
.endif

.if !empty(PKGCONFIG_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=		pkgconfig
BUILDLINK_DEPENDS.pkgconfig+=	pkgconfig>=0.15.0
BUILDLINK_PKGSRCDIR.pkgconfig?=	../../devel/pkgconfig
BUILDLINK_DEPMETHOD.pkgconfig?=	build

PKG_CONFIG_PATH?=	${LOCALBASE}/lib/pkgconfig:${X11BASE}/lib/pkgconfig
CONFIGURE_ENV+=		PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
MAKE_ENV+=		PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
.endif	# PKGCONFIG_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
