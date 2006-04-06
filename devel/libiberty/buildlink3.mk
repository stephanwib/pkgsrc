# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:51 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBIBERTY_BUILDLINK3_MK:=	${LIBIBERTY_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libiberty
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibiberty}
BUILDLINK_PACKAGES+=	libiberty

.if !empty(LIBIBERTY_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libiberty+=	libiberty>=1.0nb1
BUILDLINK_ABI_DEPENDS.libiberty?=	libiberty>=1.0nb2
BUILDLINK_PKGSRCDIR.libiberty?=	../../devel/libiberty
.endif	# LIBIBERTY_BUILDLINK3_MK
BUILDLINK_DEPMETHOD.libiberty?= build

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
