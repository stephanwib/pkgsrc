# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:41 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GDBM_BUILDLINK3_MK:=	${GDBM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gdbm
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngdbm}
BUILDLINK_PACKAGES+=	gdbm

.if !empty(GDBM_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gdbm+=	gdbm>=1.8.3
BUILDLINK_ABI_DEPENDS.gdbm+=	gdbm>=1.8.3nb1
BUILDLINK_PKGSRCDIR.gdbm?=	../../databases/gdbm
.endif	# GDBM_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
