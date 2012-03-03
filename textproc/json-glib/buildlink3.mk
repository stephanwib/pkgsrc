# $NetBSD: buildlink3.mk,v 1.6 2012/03/03 00:12:13 wiz Exp $
#

BUILDLINK_TREE+=	json-glib

.if !defined(JSON_GLIB_BUILDLINK3_MK)
JSON_GLIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.json-glib+=	json-glib>=0.6.2
BUILDLINK_ABI_DEPENDS.json-glib?=		json-glib>=0.14.2nb2
BUILDLINK_PKGSRCDIR.json-glib?=		../../textproc/json-glib

.include "../../devel/glib2/buildlink3.mk"
.endif # JSON_GLIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-json-glib
