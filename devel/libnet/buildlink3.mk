# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:21:52 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBNET_BUILDLINK3_MK:=	${LIBNET_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libnet
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibnet}
BUILDLINK_PACKAGES+=	libnet

.if !empty(LIBNET_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libnet+=	libnet>=1.0.1bnb3
BUILDLINK_ABI_DEPENDS.libnet+=	libnet>=1.0.1bnb4
BUILDLINK_PKGSRCDIR.libnet?=	../../devel/libnet
.endif	# LIBNET_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
