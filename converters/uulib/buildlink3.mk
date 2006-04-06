# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:21:40 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
UULIB_BUILDLINK3_MK:=	${UULIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	uulib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nuulib}
BUILDLINK_PACKAGES+=	uulib

.if !empty(UULIB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.uulib+=	uulib>=0.5.20
BUILDLINK_ABI_DEPENDS.uulib+=	uulib>=0.5.20nb2
BUILDLINK_PKGSRCDIR.uulib?=	../../converters/uulib
.endif	# UULIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
