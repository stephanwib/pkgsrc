# $NetBSD: buildlink3.mk,v 1.4 2004/01/24 03:26:47 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
OCAML_BUILDLINK3_MK:=	${OCAML_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ocaml
.endif

.if !empty(OCAML_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=		ocaml
BUILDLINK_DEPENDS.ocaml+=	ocaml>=3.06
BUILDLINK_PKGSRCDIR.ocaml?=	../../lang/ocaml
BUILDLINK_DEPMETHOD.ocaml?=	build
.endif	# OCAML_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
