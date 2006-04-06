# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:35 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBHYDROGEN_BUILDLINK3_MK:=	${LIBHYDROGEN_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libhydrogen
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibhydrogen}
BUILDLINK_PACKAGES+=	libhydrogen

.if !empty(LIBHYDROGEN_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libhydrogen+=		libhydrogen>=0.8.0
BUILDLINK_ABI_DEPENDS.libhydrogen+=	libhydrogen>=0.8.0nb2
BUILDLINK_PKGSRCDIR.libhydrogen?=	../../audio/libhydrogen
.endif	# LIBHYDROGEN_BUILDLINK3_MK

.include "../../audio/libaudiofile/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
