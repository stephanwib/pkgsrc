# $NetBSD: buildlink3.mk,v 1.10 2006/04/06 06:22:51 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
ICU_BUILDLINK3_MK:=	${ICU_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	icu
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nicu}
BUILDLINK_PACKAGES+=	icu

.if !empty(ICU_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.icu+=	icu>=3.4
BUILDLINK_ABI_DEPENDS.icu?=	icu>=3.4nb1
BUILDLINK_PKGSRCDIR.icu?=	../../textproc/icu
.endif	# ICU_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
