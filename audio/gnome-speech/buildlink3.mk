# $NetBSD: buildlink3.mk,v 1.9 2006/04/06 06:21:34 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GNOME_SPEECH_BUILDLINK3_MK:=	${GNOME_SPEECH_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gnome-speech
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngnome-speech}
BUILDLINK_PACKAGES+=	gnome-speech

.if !empty(GNOME_SPEECH_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gnome-speech+=	gnome-speech>=0.3.2
BUILDLINK_ABI_DEPENDS.gnome-speech+=	gnome-speech>=0.3.9nb2
BUILDLINK_PKGSRCDIR.gnome-speech?=	../../audio/gnome-speech
.endif	# GNOME_SPEECH_BUILDLINK3_MK

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libbonobo/buildlink3.mk"
.include "../../net/ORBit2/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
