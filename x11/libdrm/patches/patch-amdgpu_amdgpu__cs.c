$NetBSD: patch-amdgpu_amdgpu__cs.c,v 1.4 2024/07/02 16:24:47 wiz Exp $

libc-supplied compat alloca(3) should not be used

XXX: argue for upstream

--- amdgpu/amdgpu_cs.c.orig	2022-02-16 10:00:13.000000000 +0000
+++ amdgpu/amdgpu_cs.c
@@ -28,9 +28,7 @@
 #include <pthread.h>
 #include <sched.h>
 #include <sys/ioctl.h>
-#if HAVE_ALLOCA_H
-# include <alloca.h>
-#endif
+#define alloca(size) __builtin_alloca(size)
 
 #include "xf86drm.h"
 #include "amdgpu_drm.h"
