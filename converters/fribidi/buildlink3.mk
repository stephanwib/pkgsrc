# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:39 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FRIBIDI_BUILDLINK3_MK:=	${FRIBIDI_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	fribidi
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfribidi}
BUILDLINK_PACKAGES+=	fribidi

.if !empty(FRIBIDI_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.fribidi+=	fribidi>=0.10.4
BUILDLINK_ABI_DEPENDS.fribidi+=	fribidi>=0.10.4nb1
BUILDLINK_PKGSRCDIR.fribidi?=	../../converters/fribidi
.endif	# FRIBIDI_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
