# $NetBSD: buildlink3.mk,v 1.5 2006/04/06 06:21:37 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
TREMOR_BUILDLINK3_MK:=	${TREMOR_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	tremor
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ntremor}
BUILDLINK_PACKAGES+=	tremor

.if !empty(TREMOR_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.tremor+=	tremor>=1.0.2
BUILDLINK_ABI_DEPENDS.tremor+=	tremor>=1.0.2nb5
BUILDLINK_PKGSRCDIR.tremor?=	../../audio/tremor
.endif	# TREMOR_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
