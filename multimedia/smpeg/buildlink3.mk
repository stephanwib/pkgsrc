# $NetBSD: buildlink3.mk,v 1.7 2006/04/06 06:22:27 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
SPMEG_BUILDLINK3_MK:=	${SPMEG_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	smpeg
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsmpeg}
BUILDLINK_PACKAGES+=	smpeg

.if !empty(SPMEG_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.smpeg+=	smpeg>=0.4.4nb3
BUILDLINK_ABI_DEPENDS.smpeg+=	smpeg>=0.4.4nb12
BUILDLINK_PKGSRCDIR.smpeg?=	../../multimedia/smpeg
.endif	# SMPEG_BUILDLINK3_MK

.include "../../devel/SDL/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
