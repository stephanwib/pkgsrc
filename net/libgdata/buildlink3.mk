# $NetBSD: buildlink3.mk,v 1.6 2011/08/02 21:50:46 gls Exp $

BUILDLINK_TREE+=	libgdata

.if !defined(LIBGDATA_BUILDLINK3_MK)
LIBGDATA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgdata+=	libgdata>=0.6.4
BUILDLINK_ABI_DEPENDS.libgdata+=	libgdata>=0.6.6nb2
BUILDLINK_PKGSRCDIR.libgdata?=	../../net/libgdata


.include "../../devel/glib2/buildlink3.mk"
.include "../../net/libsoup24/buildlink3.mk"

.endif	# LIBGDATA_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgdata
