## Process this file with automake to produce Makefile.in
# Copyright (C) 2001 Yoshito Komatsu
#               2014, 2015 Mitsutoshi NAKANO <bkbin005@rinku.zaq.ne.jp>
#
# This program is free software; you can redistribute it and/or modify it 
# under the terms of the GNU General Public License as published 
# by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program;
# if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

AUTOMAKE_OPTIONS= check-news
SUFFIXES= .ctb .cbd .cld

EXTRA_DIST= yu2.PL KEN_ALL.CSV JIGYOSYO.CSV README.eucJP COPYING.GPL2
CLEANFILES= @CANNATARGETS@ $(CANNATMPFILE) @WNNTARGETS@

cannadic_DATA= @CANNATARGETS@
cannadicdir= @CANNADICDIR@
CANNATMPFILE=yubin7.ctd

wnndic_DATA= @WNNTARGETS@
wnndicdir= @WNNDICDIR@

$(wnndic_DATA):
	$(top_srcdir)/yu2.PL --yubin=$(top_srcdir)/KEN_ALL.CSV --jigyosho=$(top_srcdir)/JIGYOSYO.CSV --ime=wnn | $(ATOD) -s 200000 $@

$(cannadic_DATA): $(CANNATMPFILE)

$(CANNATMPFILE):
	$(top_srcdir)/yu2.PL --yubin=$(top_srcdir)/KEN_ALL.CSV --jigyosho=$(top_srcdir)/JIGYOSYO.CSV >$@

.ctd.cbd:
	$(MKBINDIC) $<

.ctd.cld:
	$(MKBINDIC) $<
