# $NetBSD: buildlink3.mk,v 1.9 2006/04/06 06:21:58 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PICO_BUILDLINK3_MK:=	${PICO_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pico
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npico}
BUILDLINK_PACKAGES+=	pico

.if !empty(PICO_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.pico+=	pico>=4.10
BUILDLINK_PKGSRCDIR.pico?=	../../editors/pico
.endif	# PICO_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
