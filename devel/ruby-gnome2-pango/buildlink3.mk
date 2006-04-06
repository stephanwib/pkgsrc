# $NetBSD: buildlink3.mk,v 1.5 2006/04/06 06:21:56 reed Exp $

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
RUBY_GNOME2_PANGO_BUILDLINK3_MK:=	${RUBY_GNOME2_PANGO_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ruby-gnome2-pango
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nruby-gnome2-pango}
BUILDLINK_PACKAGES+=	ruby-gnome2-pango

.if !empty(RUBY_GNOME2_PANGO_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.ruby-gnome2-pango+=	ruby-gnome2-pango>=0.14.1
BUILDLINK_ABI_DEPENDS.ruby-gnome2-pango?=	ruby-gnome2-pango>=0.14.1nb2
BUILDLINK_PKGSRCDIR.ruby-gnome2-pango?=	../../devel/ruby-gnome2-pango
.endif	# RUBY_GNOME2_PANGO_BUILDLINK3_MK


BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
