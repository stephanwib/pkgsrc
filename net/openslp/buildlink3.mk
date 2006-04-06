# $NetBSD: buildlink3.mk,v 1.9 2006/04/06 06:22:34 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
OPENSLP_BUILDLINK3_MK:=	${OPENSLP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	openslp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nopenslp}
BUILDLINK_PACKAGES+=	openslp

.if !empty(OPENSLP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.openslp+=	openslp>=1.0.1
BUILDLINK_ABI_DEPENDS.openslp+=	openslp>=1.2.1
BUILDLINK_PKGSRCDIR.openslp?=	../../net/openslp
.endif	# OPENSLP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
