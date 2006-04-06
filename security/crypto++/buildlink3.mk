# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:22:37 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CRYPTOPP_BUILDLINK3_MK:=	${CRYPTOPP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	cryptopp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncryptopp}
BUILDLINK_PACKAGES+=	cryptopp

.if !empty(CRYPTOPP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.cryptopp+=	cryptopp>=5.1
BUILDLINK_DEPMETHOD.cryptopp?=	build
BUILDLINK_ABI_DEPENDS.cryptopp?=	cryptopp>=5.2.1nb1
BUILDLINK_PKGSRCDIR.cryptopp?=	../../security/cryptopp
.endif	# CRYPTOPP_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
