# $NetBSD: buildlink3.mk,v 1.12 2006/04/06 06:22:52 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
METACITY_BUILDLINK3_MK:=	${METACITY_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	metacity
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nmetacity}
BUILDLINK_PACKAGES+=	metacity

.if !empty(METACITY_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.metacity+=	metacity>=2.8.5
BUILDLINK_ABI_DEPENDS.metacity+=	metacity>=2.12.2nb2
BUILDLINK_PKGSRCDIR.metacity?=	../../wm/metacity
.endif	# METACITY_BUILDLINK3_MK

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libglade2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../net/ORBit2/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
