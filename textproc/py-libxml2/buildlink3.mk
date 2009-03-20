# $NetBSD: buildlink3.mk,v 1.2 2009/03/20 17:30:12 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_LIBXML2_BUILDLINK3_MK:=	${PY_LIBXML2_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	py-libxml2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-libxml2}
BUILDLINK_PACKAGES+=	py-libxml2
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-libxml2

.if ${PY_LIBXML2_BUILDLINK3_MK} == "+"
.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.py-libxml2+=	${PYPKGPREFIX}-libxml2>=2.6.27
BUILDLINK_PKGSRCDIR.py-libxml2?=	../../textproc/py-libxml2
.endif	# PY_LIBXML2_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
