# $NetBSD: buildlink3.mk,v 1.2 2009/03/20 17:30:13 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_QT4_BUILDLINK3_MK:=		${PY_QT4_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	py-qt4
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-qt4}
BUILDLINK_PACKAGES+=	py-qt4
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-qt4

.if ${PY_QT4_BUILDLINK3_MK} == "+"
.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.py-qt4+=	${PYPKGPREFIX}-qt4>=4.4.4
BUILDLINK_PKGSRCDIR.py-qt4?=	../../x11/py-qt4
.endif	# PY_QT4_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
