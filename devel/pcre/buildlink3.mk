# $NetBSD: buildlink3.mk,v 1.8 2006/04/06 06:21:54 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PCRE_BUILDLINK3_MK:=	${PCRE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pcre
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npcre}
BUILDLINK_PACKAGES+=	pcre

.if !empty(PCRE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.pcre+=	pcre>=3.4nb1
BUILDLINK_ABI_DEPENDS.pcre+=	pcre>=6.2
BUILDLINK_PKGSRCDIR.pcre?=	../../devel/pcre
.endif	# PCRE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
