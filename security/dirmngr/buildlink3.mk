# $NetBSD: buildlink3.mk,v 1.5 2006/04/06 06:22:38 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
DIRMNGR_BUILDLINK3_MK:=	${DIRMNGR_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	dirmngr
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ndirmngr}
BUILDLINK_PACKAGES+=	dirmngr

.if !empty(DIRMNGR_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.dirmngr+=	dirmngr>=0.9.3nb1
BUILDLINK_ABI_DEPENDS.dirmngr?=	dirmngr>=0.9.3nb2
BUILDLINK_PKGSRCDIR.dirmngr?=	../../security/dirmngr
.endif	# DIRMNGR_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
