$NetBSD: patch-channels.c,v 1.1 2015/03/19 20:23:55 tron Exp $

Fix X11 forwarding under Mac OS X Yosemite. Patch taken from MacPorts.

https://trac.macports.org/browser/trunk/dports/net/openssh/files/launchd.patch?rev=121205

--- channels.c.orig	2014-02-26 23:18:33.000000000 +0000
+++ channels.c	2015-03-19 20:16:04.000000000 +0000
@@ -3576,15 +3576,35 @@
 	 * connection to the real X server.
 	 */
 
-	/* Check if the display is from launchd. */
 #ifdef __APPLE__
-	if (strncmp(display, "/tmp/launch", 11) == 0) {
-		sock = connect_local_xsocket_path(display);
-		if (sock < 0)
-			return -1;
+	/* Check if the display is a path to a socket (as set by launchd). */
+	{
+		char path[PATH_MAX];
+		struct stat sbuf;
+		int is_path_to_socket = 0;
+
+		strlcpy(path, display, sizeof(path));
+		if (0 == stat(path, &sbuf)) {
+			is_path_to_socket = 1;
+		} else {
+			char *dot = strrchr(path, '.');
+			if (dot) {
+				*dot = '\0';
+				/* screen = atoi(dot + 1); */
+				if (0 == stat(path, &sbuf)) {
+					is_path_to_socket=1;
+				}
+			}
+		}
 
-		/* OK, we now have a connection to the display. */
-		return sock;
+		if (is_path_to_socket) {
+			sock = connect_local_xsocket_path(path);
+			if (sock < 0)
+				return -1;
+
+			/* OK, we now have a connection to the display. */
+			return sock;
+		}
 	}
 #endif
 	/*
