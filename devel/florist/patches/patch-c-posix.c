$NetBSD: patch-c-posix.c,v 1.3 2004/06/30 11:23:43 shannonjr Exp $

--- c-posix.c.orig	2002-10-24 02:03:51.000000000 -0600
+++ c-posix.c
@@ -571,7 +571,7 @@ typedef struct siginfo {
 #endif
   GT2(si_signo, int)
   GT2(si_code, int)
-  GT2(si_value, union sigval)
+  GT2(si_sigval, union sigval)
   GT3
 
 /* sigevent must precede aiocb
@@ -2788,7 +2788,11 @@ void create_limits() {
 #endif
 
 #ifdef SEM_VALUE_MAX
+#if SEM_VALUE_MAX > INT_MAX
+  gmaxnn("Semaphores_Value",INT_MAX);
+#else
   gmaxnn("Semaphores_Value",SEM_VALUE_MAX);
+#endif
 #else
 #ifdef _POSIX_SEM_VALUE_MAX
   gmaxn("Semaphores_Value",_POSIX_SEM_VALUE_MAX);
@@ -6344,7 +6348,7 @@ void create_c() {
   g_struct_msghdr();
   gcmnt("local socket address");
   { struct sockaddr_un DUMMY;
-    ifprintf(fp,"   subtype sun_path_string is
+    ifprintf(fp,"   subtype sun_path_string is \
       POSIX_String (1 .. %d);\n", sizeof (DUMMY.sun_path));
   }
   g_struct_sockaddr_un();
