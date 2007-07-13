# $NetBSD: buildlink3.mk,v 1.1 2007/07/13 14:58:38 drochner Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_CTYPES_BUILDLINK3_MK:=	${PY_CTYPES_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	py-ctypes
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-ctypes}
BUILDLINK_PACKAGES+=	py-ctypes
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-ctypes

.if ${PY_CTYPES_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.py-ctypes+=	${PYPKGPREFIX}-ctypes>=1.0.0
BUILDLINK_PKGSRCDIR.py-ctypes?=		../../devel/py-ctypes
.endif	# PY_CTYPES_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
