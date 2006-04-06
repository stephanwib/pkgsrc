# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:22:54 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FCGI_BUILDLINK3_MK:=	${FCGI_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	fcgi
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfcgi}
BUILDLINK_PACKAGES+=	fcgi

.if !empty(FCGI_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.fcgi+=	fcgi>=2.2.2nb1
BUILDLINK_ABI_DEPENDS.fcgi+=	fcgi>=2.4.0nb1
BUILDLINK_PKGSRCDIR.fcgi?=	../../www/fcgi
.endif	# FCGI_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
