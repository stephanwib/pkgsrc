# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:22:19 reed Exp $
# XXX	BUILDLINK_DEPMETHOD.R?=	build

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
R_BUILDLINK3_MK:=	${R_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	R
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NR}
BUILDLINK_PACKAGES+=	R

.if !empty(R_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.R+=	R>=1.7.0
BUILDLINK_ABI_DEPENDS.R?=	R>=2.2.1nb2
BUILDLINK_PKGSRCDIR.R?=	../../math/R
.endif	# R_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
