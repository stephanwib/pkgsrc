From ad4a8ff7d9097008d7623df8543df435bfddeac8 Mon Sep 17 00:00:00 2001
From: Simon Kelley <simon@thekelleys.org.uk>
Date: Thu, 9 Apr 2015 21:48:00 +0100
Subject: [PATCH] Fix crash on receipt of certain malformed DNS requests.

---
 CHANGELOG     |    3 +++
 src/rfc1035.c |    9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/src/rfc1035.c b/src/rfc1035.c
index 7a07b0c..a995ab5 100644
--- src/rfc1035.c
+++ src/rfc1035.c
@@ -1198,7 +1198,10 @@ unsigned int extract_request(struct dns_header *header, size_t qlen, char *name,
 size_t setup_reply(struct dns_header *header, size_t qlen,
 		struct all_addr *addrp, unsigned int flags, unsigned long ttl)
 {
-  unsigned char *p = skip_questions(header, qlen);
+  unsigned char *p;
+
+  if (!(p = skip_questions(header, qlen)))
+    return 0;
   
   /* clear authoritative and truncated flags, set QR flag */
   header->hb3 = (header->hb3 & ~(HB3_AA | HB3_TC)) | HB3_QR;
@@ -1214,7 +1217,7 @@ size_t setup_reply(struct dns_header *header, size_t qlen,
     SET_RCODE(header, NOERROR); /* empty domain */
   else if (flags == F_NXDOMAIN)
     SET_RCODE(header, NXDOMAIN);
-  else if (p && flags == F_IPV4)
+  else if (flags == F_IPV4)
     { /* we know the address */
       SET_RCODE(header, NOERROR);
       header->ancount = htons(1);
@@ -1222,7 +1225,7 @@ size_t setup_reply(struct dns_header *header, size_t qlen,
       add_resource_record(header, NULL, NULL, sizeof(struct dns_header), &p, ttl, NULL, T_A, C_IN, "4", addrp);
     }
 #ifdef HAVE_IPV6
-  else if (p && flags == F_IPV6)
+  else if (flags == F_IPV6)
     {
       SET_RCODE(header, NOERROR);
       header->ancount = htons(1);
