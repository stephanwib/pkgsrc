# $NetBSD: buildlink3.mk,v 1.1.1.1 2006/07/12 16:34:39 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_PSYCOPG_BUILDLINK3_MK:=	${PY_PSYCOPG_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	psycopg
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npsycopg}
BUILDLINK_PACKAGES+=	psycopg

.if !empty(PY_PSYCOPG_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.psycopg+=	${PYPKGPREFIX}-psycopg>=1.1.21
BUILDLINK_ABI_DEPENDS.psycopg?=	${PYPKGPREFIX}-psycopg>=1.1.21nb1
BUILDLINK_PKGSRCDIR.psycopg?=	../../databases/py-psycopg
.endif	# PY_PSYCOPG_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
