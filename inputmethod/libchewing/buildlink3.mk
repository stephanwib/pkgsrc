# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:22:06 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBCHEWING_BUILDLINK3_MK:=	${LIBCHEWING_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libchewing
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibchewing}
BUILDLINK_PACKAGES+=	libchewing

.if !empty(LIBCHEWING_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libchewing+=		libchewing>=0.2.7
BUILDLINK_ABI_DEPENDS.libchewing+=	libchewing>=0.2.7
BUILDLINK_PKGSRCDIR.libchewing?=	../../inputmethod/libchewing
.endif	# LIBCHEWING_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
