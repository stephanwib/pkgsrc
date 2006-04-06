# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:22:33 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBLIVE_BUILDLINK3_MK:=	${LIBLIVE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	liblive
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nliblive}
BUILDLINK_PACKAGES+=	liblive

.if !empty(LIBLIVE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.liblive+=	liblive>=2003.04.04
BUILDLINK_ABI_DEPENDS.liblive+=	liblive>=2003.04.04nb1
BUILDLINK_PKGSRCDIR.liblive?=	../../net/liblive
.endif	# LIBLIVE_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
