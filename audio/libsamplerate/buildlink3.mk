# $NetBSD: buildlink3.mk,v 1.6 2006/04/06 06:21:35 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBSAMPLERATE_BUILDLINK3_MK:=	${LIBSAMPLERATE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libsamplerate
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibsamplerate}
BUILDLINK_PACKAGES+=	libsamplerate

.if !empty(LIBSAMPLERATE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libsamplerate+=	libsamplerate>=0.0.13nb1
BUILDLINK_ABI_DEPENDS.libsamplerate+=	libsamplerate>=0.1.2nb2
BUILDLINK_PKGSRCDIR.libsamplerate?=	../../audio/libsamplerate
.endif	# LIBSAMPLERATE_BUILDLINK3_MK

.include "../../audio/libsndfile/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
