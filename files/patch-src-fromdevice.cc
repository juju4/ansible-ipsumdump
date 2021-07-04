--- src/fromdevice.cc.orig	2021-07-04 00:06:48.987000000 +0000
+++ src/fromdevice.cc	2021-07-04 00:07:40.366000000 +0000
@@ -543,7 +543,7 @@
	    } else
		p->take(_snaplen - len);
	    p->set_packet_type_anno((Packet::PacketType)sa.sll_pkttype);
-	    p->timestamp_anno().set_timeval_ioctl(_fd, SIOCGSTAMP);
+	    p->timestamp_anno().set_timeval_ioctl(_fd, SIOCGSTAMP_OLD);
	    p->set_mac_header(p->data());
	    ++nlinux;
	    ++_count;
