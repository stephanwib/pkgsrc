# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:21:46 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
BUDDY_BUILDLINK3_MK:=	${BUDDY_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	buddy
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nbuddy}
BUILDLINK_PACKAGES+=	buddy

.if !empty(BUDDY_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.buddy+=	buddy>=2.4
BUILDLINK_PKGSRCDIR.buddy?=	../../devel/buddy
.endif	# BUDDY_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
