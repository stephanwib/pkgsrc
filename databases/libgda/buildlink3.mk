# $NetBSD: buildlink3.mk,v 1.26 2013/07/18 04:51:02 obache Exp $

BUILDLINK_TREE+=	libgda

.if !defined(LIBGDA_BUILDLINK3_MK)
LIBGDA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgda+=	libgda>=2.99.2
BUILDLINK_ABI_DEPENDS.libgda+=	libgda>=3.0.1nb7
BUILDLINK_PKGSRCDIR.libgda?=	../../databases/libgda

.include "../../mk/bsd.fast.prefs.mk"

pkgbase := libgda
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.libgda:Mfam)
.include "../../mk/fam.buildlink3.mk"
.endif

.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/readline.buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif # LIBGDA_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgda
