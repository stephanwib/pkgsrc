# $NetBSD: buildlink3.mk,v 1.4 2004/01/24 03:26:46 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PCRE_BUILDLINK3_MK:=	${PCRE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pcre
.endif

.if !empty(PCRE_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=		pcre
BUILDLINK_DEPENDS.pcre+=	pcre>=3.4nb1
BUILDLINK_PKGSRCDIR.pcre?=	../../devel/pcre
.endif	# PCRE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
