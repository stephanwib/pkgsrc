# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:53 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBRSYNC_BUILDLINK3_MK:=	${LIBRSYNC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	librsync
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibrsync}
BUILDLINK_PACKAGES+=	librsync

.if !empty(LIBRSYNC_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.librsync+=	librsync>=0.9.6nb2
BUILDLINK_ABI_DEPENDS.librsync+=	librsync>=0.9.7nb1
BUILDLINK_PKGSRCDIR.librsync?=	../../devel/librsync
.endif	# LIBRSYNC_BUILDLINK3_MK

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/popt/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
