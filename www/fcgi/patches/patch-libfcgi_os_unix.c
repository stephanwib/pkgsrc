$NetBSD: patch-libfcgi_os_unix.c,v 1.1 2015/05/20 04:10:38 kim Exp $

Use poll instead of select. Fixes CVE-2012-6687.

https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;filename=poll.patch;att=1;bug=681591

--- libfcgi/os_unix.c.orig	2002-03-05 19:14:49.000000000 +0000
+++ libfcgi/os_unix.c	2015-05-20 03:46:19.000000000 +0000
@@ -42,6 +42,7 @@
 #include <sys/time.h>
 #include <sys/un.h>
 #include <signal.h>
+#include <poll.h>
 
 #ifdef HAVE_NETDB_H
 #include <netdb.h>
@@ -103,6 +104,9 @@
 static int shutdownPending = FALSE;
 static int shutdownNow = FALSE;
 
+static int libfcgiOsClosePollTimeout = 2000;
+static int libfcgiIsAfUnixKeeperPollTimeout = 2000;
+
 void OS_ShutdownPending()
 {
     shutdownPending = TRUE;
@@ -168,6 +172,16 @@
     if(libInitialized)
         return 0;
 
+    char *libfcgiOsClosePollTimeoutStr = getenv( "LIBFCGI_OS_CLOSE_POLL_TIMEOUT" );
+    if(libfcgiOsClosePollTimeoutStr) {
+        libfcgiOsClosePollTimeout = atoi(libfcgiOsClosePollTimeoutStr);
+    }
+
+    char *libfcgiIsAfUnixKeeperPollTimeoutStr = getenv( "LIBFCGI_IS_AF_UNIX_KEEPER_POLL_TIMEOUT" );
+    if(libfcgiIsAfUnixKeeperPollTimeoutStr) {
+        libfcgiIsAfUnixKeeperPollTimeout = atoi(libfcgiIsAfUnixKeeperPollTimeoutStr);
+    }
+
     asyncIoTable = (AioInfo *)malloc(asyncIoTableSize * sizeof(AioInfo));
     if(asyncIoTable == NULL) {
         errno = ENOMEM;
@@ -755,19 +769,16 @@
 
     if (shutdown(fd, 1) == 0)
     {
-        struct timeval tv;
-        fd_set rfds;
+        struct pollfd pfd;
         int rv;
         char trash[1024];
 
-        FD_ZERO(&rfds);
+        pfd.fd = fd;
+        pfd.events = POLLIN;
 
         do 
         {
-            FD_SET(fd, &rfds);
-            tv.tv_sec = 2;
-            tv.tv_usec = 0;
-            rv = select(fd + 1, &rfds, NULL, NULL, &tv);
+            rv = poll(&pfd, 1, libfcgiOsClosePollTimeout);
         }
         while (rv > 0 && read(fd, trash, sizeof(trash)) > 0);
     }
@@ -1116,13 +1127,11 @@
  */
 static int is_af_unix_keeper(const int fd)
 {
-    struct timeval tval = { READABLE_UNIX_FD_DROP_DEAD_TIMEVAL };
-    fd_set read_fds;
-
-    FD_ZERO(&read_fds);
-    FD_SET(fd, &read_fds);
+    struct pollfd pfd;
+    pfd.fd = fd;
+    pfd.events = POLLIN;
 
-    return select(fd + 1, &read_fds, NULL, NULL, &tval) >= 0 && FD_ISSET(fd, &read_fds);
+    return poll(&pfd, 1, libfcgiIsAfUnixKeeperPollTimeout) >= 0 && (pfd.revents & POLLIN);
 }
 
 /*
