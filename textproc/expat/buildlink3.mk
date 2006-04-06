# $NetBSD: buildlink3.mk,v 1.16 2006/04/06 06:22:50 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
EXPAT_BUILDLINK3_MK:=	${EXPAT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	expat
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nexpat}
BUILDLINK_PACKAGES+=	expat

.if !empty(EXPAT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.expat+=	expat>=1.95.7
BUILDLINK_ABI_DEPENDS.expat+=	expat>=2.0.0nb1
BUILDLINK_PKGSRCDIR.expat?=	../../textproc/expat
.endif	# EXPAT_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
