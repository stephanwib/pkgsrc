# $NetBSD: buildlink3.mk,v 1.52 2015/04/25 11:19:18 tnn Exp $

BUILDLINK_TREE+=	MesaLib

.if !defined(MESALIB_BUILDLINK3_MK)
MESALIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.MesaLib+=	MesaLib>=3.4.2
BUILDLINK_ABI_DEPENDS.MesaLib+=	MesaLib>=7.11.2
BUILDLINK_PKGSRCDIR.MesaLib?=	../../graphics/MesaLib

.include "../../mk/bsd.fast.prefs.mk"

.if ${X11_TYPE} == "modular"
BUILDLINK_ABI_DEPENDS.MesaLib+=	MesaLib>=10.5.3
# This is needed to avoid linking conflicting libstdc++ versions
.if defined(USE_LANGUAGES) && !empty(USE_LANGUAGES:Mc++)
GCC_REQD+=	4.2
.endif
.endif

# See <http://developer.apple.com/qa/qa2007/qa1567.html>.
.if !empty(MACHINE_PLATFORM:MDarwin-[9].*-*)
BUILDLINK_LDFLAGS.MesaLib+=	-Wl,-dylib_file,/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib:/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib
.endif

pkgbase:= MesaLib
.include "../../mk/pkg-build-options.mk"

.if ${X11_TYPE} == "native" && ${OPSYS} != "Cygwin" && exists(${X11BASE}/lib/pkgconfig/dri.pc)
PKG_BUILD_OPTIONS.MesaLib+=	dri
.endif

.if !empty(PKG_BUILD_OPTIONS.MesaLib:Mdri)
.  include "../../graphics/MesaLib/dri.mk"
.endif

.if !empty(MACHINE_PLATFORM:MNetBSD-[12].*)
.include "../../devel/pthread-stublib/buildlink3.mk"
.endif

.include "../../x11/libXext/buildlink3.mk"
.endif # MESALIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-MesaLib
