# $NetBSD: buildlink3.mk,v 1.2 2009/03/20 17:30:11 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_PEXPECT_BUILDLINK3_MK:=	${PY_PEXPECT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	py-pexpect
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-pexpect}
BUILDLINK_PACKAGES+=	py-pexpect
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-pexpect

.if !empty(PY_PEXPECT_BUILDLINK3_MK:M+)
.  include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.py-pexpect+=	${PYPKGPREFIX}-pexpect>=2.1
BUILDLINK_ABI_DEPENDS.py-pexpect+=	${PYPKGPREFIX}-pexpect>=2.1
BUILDLINK_PKGSRCDIR.py-pexpect?=		../../devel/py-pexpect
.endif	# PY_PEXPECT_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
