$NetBSD: patch-lib_cpp_src_protocol_TBase64Utils.cpp,v 1.1 2017/09/16 12:30:28 tnn Exp $

error: narrowing conversion of '-1' from 'int' to
'__uint8_t {aka unsigned char}' inside { } [-Wnarrowing]

--- lib/cpp/src/protocol/TBase64Utils.cpp.orig	2011-08-11 13:18:59.000000000 +0000
+++ lib/cpp/src/protocol/TBase64Utils.cpp
@@ -44,22 +44,22 @@ void  base64_encode(const uint8_t *in, u
 }
 
 static const uint8_t kBase64DecodeTable[256] ={
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,
-  52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,
-  -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,
-  15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,
-  -1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
-  41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
-  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,62,255,255,255,63,
+  52,53,54,55,56,57,58,59,60,61,255,255,255,255,255,255,
+  255, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,
+  15,16,17,18,19,20,21,22,23,24,25,255,255,255,255,255,
+  255,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
+  41,42,43,44,45,46,47,48,49,50,51,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
+  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
 };
 
 void base64_decode(uint8_t *buf, uint32_t len) {
