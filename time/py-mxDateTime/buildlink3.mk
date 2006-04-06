# $NetBSD: buildlink3.mk,v 1.9 2006/04/06 06:22:52 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_MXDATETIME_BUILDLINK3_MK:=	${PY_MXDATETIME_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	py-mxDateTime
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-mxDateTime}
BUILDLINK_PACKAGES+=	py-mxDateTime

.if !empty(PY_MXDATETIME_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.py-mxDateTime+=	${PYPKGPREFIX}-mxDateTime>=2.0.5
BUILDLINK_ABI_DEPENDS.py-mxDateTime?=	${PYPKGPREFIX}-mxDateTime>=2.0.6nb1
BUILDLINK_PKGSRCDIR.py-mxDateTime?=	../../time/py-mxDateTime
BUILDLINK_INCDIRS.py-mxDateTime+=	${PYSITELIB}/mx/DateTime/mxDateTime
.endif	# PY_MXDATETIME_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
