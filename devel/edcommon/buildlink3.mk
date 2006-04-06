# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:48 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
EDCOMMON_BUILDLINK3_MK:=	${EDCOMMON_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	edcommon
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nedcommon}
BUILDLINK_PACKAGES+=	edcommon

.if !empty(EDCOMMON_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.edcommon+=	edcommon>=32
BUILDLINK_ABI_DEPENDS.edcommon?=	edcommon>=32nb2
BUILDLINK_PKGSRCDIR.edcommon?=	../../devel/edcommon
.endif	# EDCOMMON_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
