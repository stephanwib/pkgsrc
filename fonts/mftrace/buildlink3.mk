# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:59 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
MFTRACE_BUILDLINK3_MK:=	${MFTRACE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	mftrace
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nmftrace}
BUILDLINK_PACKAGES+=	mftrace

.if !empty(MFTRACE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.mftrace+=	mftrace>=1.0.19
BUILDLINK_ABI_DEPENDS.mftrace?=	mftrace>=1.1.1nb3
BUILDLINK_PKGSRCDIR.mftrace?=	../../fonts/mftrace
.endif	# MFTRACE_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
