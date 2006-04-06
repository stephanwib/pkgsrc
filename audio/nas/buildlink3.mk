# $NetBSD: buildlink3.mk,v 1.6 2006/04/06 06:21:36 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NAS_BUILDLINK3_MK:=	${NAS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	nas
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnas}
BUILDLINK_PACKAGES+=	nas

.if !empty(NAS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.nas+=		nas>=1.4.2
BUILDLINK_ABI_DEPENDS.nas?=	nas>=1.7bnb2
BUILDLINK_PKGSRCDIR.nas?=	../../audio/nas
.endif	# NAS_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
