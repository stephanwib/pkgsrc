# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:21:48 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
DMALLOC_BUILDLINK3_MK:=	${DMALLOC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	dmalloc
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ndmalloc}
BUILDLINK_PACKAGES+=	dmalloc

.if !empty(DMALLOC_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.dmalloc+=	dmalloc>=4.8.2nb2
BUILDLINK_PKGSRCDIR.dmalloc?=	../../devel/dmalloc
BUILDLINK_DEPMETHOD.dmalloc?=	build
.endif	# DMALLOC_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
