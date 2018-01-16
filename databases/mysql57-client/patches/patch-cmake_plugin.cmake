$NetBSD: patch-cmake_plugin.cmake,v 1.2 2018/01/16 16:29:42 adam Exp $

Build with newer DTrace.

--- cmake/plugin.cmake.orig	2017-12-28 03:46:26.000000000 +0000
+++ cmake/plugin.cmake
@@ -52,7 +52,7 @@ ENDMACRO()
 MACRO(MYSQL_ADD_PLUGIN)
   MYSQL_PARSE_ARGUMENTS(ARG
     "LINK_LIBRARIES;DEPENDENCIES;MODULE_OUTPUT_NAME;STATIC_OUTPUT_NAME"
-    "STORAGE_ENGINE;STATIC_ONLY;MODULE_ONLY;CLIENT_ONLY;MANDATORY;DEFAULT;DISABLED;NOT_FOR_EMBEDDED;RECOMPILE_FOR_EMBEDDED;TEST_ONLY"
+    "STORAGE_ENGINE;STATIC_ONLY;MODULE_ONLY;CLIENT_ONLY;MANDATORY;DEFAULT;DISABLED;NOT_FOR_EMBEDDED;RECOMPILE_FOR_EMBEDDED;DTRACE_INSTRUMENTED;TEST_ONLY"
     ${ARGN}
   )
   
@@ -146,7 +146,9 @@ MACRO(MYSQL_ADD_PLUGIN)
       -P ${CMAKE_BINARY_DIR}/archive_output_directory/lib_location_${target}.cmake
       )
 
-    DTRACE_INSTRUMENT(${target})
+    IF(ARG_DTRACE_INSTRUMENTED)
+      DTRACE_INSTRUMENT(${target})
+    ENDIF()
     ADD_DEPENDENCIES(${target} GenError ${ARG_DEPENDENCIES})
     IF(WITH_EMBEDDED_SERVER AND NOT ARG_NOT_FOR_EMBEDDED)
       # Embedded library should contain PIC code and be linkable
@@ -154,7 +156,9 @@ MACRO(MYSQL_ADD_PLUGIN)
       IF(ARG_RECOMPILE_FOR_EMBEDDED OR NOT _SKIP_PIC)
         # Recompile some plugins for embedded
         ADD_CONVENIENCE_LIBRARY(${target}_embedded ${SOURCES})
-        DTRACE_INSTRUMENT(${target}_embedded)   
+        IF(ARG_DTRACE_INSTRUMENTED)
+          DTRACE_INSTRUMENT(${target}_embedded)
+        ENDIF()
         IF(ARG_RECOMPILE_FOR_EMBEDDED)
           SET_TARGET_PROPERTIES(${target}_embedded 
             PROPERTIES COMPILE_DEFINITIONS "MYSQL_SERVER;EMBEDDED_LIBRARY")
@@ -218,7 +222,9 @@ MACRO(MYSQL_ADD_PLUGIN)
 
     ADD_VERSION_INFO(${target} MODULE SOURCES)
     ADD_LIBRARY(${target} MODULE ${SOURCES}) 
-    DTRACE_INSTRUMENT(${target})
+    IF(ARG_DTRACE_INSTRUMENTED)
+      DTRACE_INSTRUMENT(${target})
+    ENDIF()
     SET_TARGET_PROPERTIES (${target} PROPERTIES PREFIX ""
       COMPILE_DEFINITIONS "MYSQL_DYNAMIC_PLUGIN")
     IF(NOT ARG_CLIENT_ONLY)
