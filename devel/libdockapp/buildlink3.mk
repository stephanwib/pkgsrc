# $NetBSD: buildlink3.mk,v 1.5 2006/04/06 06:21:50 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBDOCKAPP_BUILDLINK3_MK:=	${LIBDOCKAPP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libdockapp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibdockapp}
BUILDLINK_PACKAGES+=	libdockapp

.if !empty(LIBDOCKAPP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libdockapp+=		libdockapp>=0.4.0
BUILDLINK_ABI_DEPENDS.libdockapp+=	libdockapp>=0.4.0nb2
BUILDLINK_PKGSRCDIR.libdockapp?=	../../devel/libdockapp
.endif	# LIBDOCKAPP_BUILDLINK3_MK

.include "../../graphics/xpm/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
