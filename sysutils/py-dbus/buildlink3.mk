# $NetBSD: buildlink3.mk,v 1.8 2009/03/20 17:30:12 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_DBUS_BUILDLINK3_MK:=		${PY_DBUS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	py-dbus
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-dbus}
BUILDLINK_PACKAGES+=	py-dbus
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-dbus

.if !empty(PY_DBUS_BUILDLINK3_MK:M+)
.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.py-dbus+=	${PYPKGPREFIX}-dbus>=0.23.4
BUILDLINK_ABI_DEPENDS.py-dbus?=	${PYPKGPREFIX}-dbus>=0.71
BUILDLINK_PKGSRCDIR.py-dbus?=	../../sysutils/py-dbus
.endif	# PY_DBUS_BUILDLINK3_MK

.include "../../devel/glib2/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
