# $NetBSD: buildlink3.mk,v 1.4 2004/01/24 03:26:47 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBUNGIF_BUILDLINK3_MK:=	${LIBUNGIF_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libungif
.endif

.if !empty(LIBUNGIF_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=		libungif
BUILDLINK_DEPENDS.libungif+=	libungif>=4.1.0
BUILDLINK_PKGSRCDIR.libungif?=	../../graphics/libungif
.endif	# LIBUNGIF_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
