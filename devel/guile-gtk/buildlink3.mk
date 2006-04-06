# $NetBSD: buildlink3.mk,v 1.5 2006/04/06 06:21:49 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GUILE_GTK_BUILDLINK3_MK:=	${GUILE_GTK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	guile-gtk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nguile-gtk}
BUILDLINK_PACKAGES+=	guile-gtk

.if !empty(GUILE_GTK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.guile-gtk+=	guile-gtk>=0.40
BUILDLINK_ABI_DEPENDS.guile-gtk?=	guile-gtk>=0.40.91nb1
BUILDLINK_PKGSRCDIR.guile-gtk?=	../../devel/guile-gtk
.endif	# GUILE_GTK_BUILDLINK3_MK

.include "../../lang/guile/buildlink3.mk"
.include "../../x11/gtk/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
