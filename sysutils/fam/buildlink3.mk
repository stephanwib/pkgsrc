# $NetBSD: buildlink3.mk,v 1.5 2006/04/06 06:22:45 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FAM_BUILDLINK3_MK:=	${FAM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	fam
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfam}
BUILDLINK_PACKAGES+=	fam

.if !empty(FAM_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.fam+=		fam>=2.6.10
BUILDLINK_ABI_DEPENDS.fam+=	fam>=2.7.0nb7
BUILDLINK_PKGSRCDIR.fam?=	../../sysutils/fam
.endif	# FAM_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
