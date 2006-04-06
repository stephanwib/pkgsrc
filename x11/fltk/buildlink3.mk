# $NetBSD: buildlink3.mk,v 1.12 2006/04/06 06:22:57 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FLTK_BUILDLINK3_MK:=	${FLTK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	fltk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfltk}
BUILDLINK_PACKAGES+=	fltk

.if !empty(FLTK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.fltk+=	fltk>=1.1.5rc1
BUILDLINK_ABI_DEPENDS.fltk+=	fltk>=1.1.7nb1
BUILDLINK_PKGSRCDIR.fltk?=	../../x11/fltk
BUILDLINK_FILES.fltk+=		include/Fl/*
.endif	# FLTK_BUILDLINK3_MK

.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/x11.buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
