# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:22:10 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
ERLANG_BUILDLINK3_MK:=		${ERLANG_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=		erlang
.endif

BUILDLINK_PACKAGES:=		${BUILDLINK_PACKAGES:Nerlang}
BUILDLINK_PACKAGES+=		erlang

.if !empty(ERLANG_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.erlang+=	erlang>=10.1
BUILDLINK_ABI_DEPENDS.erlang?=	erlang>=10.1.9nb1
BUILDLINK_PKGSRCDIR.erlang?=	../../lang/erlang
.endif	# ERLANG_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
