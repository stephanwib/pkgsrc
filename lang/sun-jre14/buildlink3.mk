# $NetBSD: buildlink3.mk,v 1.5 2006/04/06 06:22:14 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SUN_JRE14_BUILDLINK3_MK:=	${SUN_JRE14_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	sun-jre14
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsun-jre14}
BUILDLINK_PACKAGES+=	sun-jre14

.if !empty(SUN_JRE14_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.sun-jre14+=		sun-jre14-[0-9]*
BUILDLINK_ABI_DEPENDS.sun-jre14?=	sun-jre14>=2.11
BUILDLINK_PKGSRCDIR.sun-jre14?=		../../lang/sun-jre14
BUILDLINK_JAVA_PREFIX.sun-jre14=	${PREFIX}/java/sun-1.4
.endif	# SUN_JRE14_BUILDLINK3_MK

UNLIMIT_RESOURCES+=	datasize	# Must be at least 131204

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
