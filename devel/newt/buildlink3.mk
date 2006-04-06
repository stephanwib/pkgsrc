# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:21:54 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NEWT_BUILDLINK3_MK:=	${NEWT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	newt
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnewt}
BUILDLINK_PACKAGES+=	newt

.if !empty(NEWT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.newt+=	newt>=0.51.6
BUILDLINK_ABI_DEPENDS.newt?=	newt>=0.51.6nb2
BUILDLINK_PKGSRCDIR.newt?=	../../devel/newt
.endif	# NEWT_BUILDLINK3_MK

.include "../../devel/libslang/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
