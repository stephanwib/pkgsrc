# $NetBSD: buildlink3.mk,v 1.3 2014/07/22 11:01:53 wiz Exp $

BUILDLINK_TREE+=	libabw

.if !defined(LIBABW_BUILDLINK3_MK)
LIBABW_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libabw+=	libabw>=0.0.1
BUILDLINK_ABI_DEPENDS.libabw?=	libabw>=0.1.0
BUILDLINK_PKGSRCDIR.libabw?=	../../converters/libabw

.include "../../converters/libwpd/buildlink3.mk"
.endif	# LIBABW_BUILDLINK3_MK

BUILDLINK_TREE+=	-libabw
