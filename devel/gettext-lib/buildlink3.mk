# $NetBSD: buildlink3.mk,v 1.25 2006/04/06 06:21:49 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GETTEXT_BUILDLINK3_MK:=	${GETTEXT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gettext
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngettext}
BUILDLINK_PACKAGES+=	gettext

.if !empty(GETTEXT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gettext+=	gettext-lib>=0.14.5
BUILDLINK_PKGSRCDIR.gettext?=	../../devel/gettext-lib
.endif	# GETTEXT_BUILDLINK3_MK

# Let the gettext-lib/builtin.mk pull in libiconv if it's needed.
#.include "../../converters/libiconv/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
