# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:22:06 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
URT_BUILDLINK3_MK:=	${URT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	urt
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nurt}
BUILDLINK_PACKAGES+=	urt

.if !empty(URT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.urt+=	urt>=3.1b1nb5
BUILDLINK_ABI_DEPENDS.urt?=	urt>=3.1b1nb6
BUILDLINK_PKGSRCDIR.urt?=	../../graphics/urt
.endif	# URT_BUILDLINK3_MK

.include "../../graphics/netpbm/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
