## Process this file with automake to produce Makefile.in
# Copyright (C) 2001 Yoshito Komatsu
#               2014, 2015 Mitsutoshi NAKANO <bkbin005@rinku.zaq.ne.jp>
#
# This program is free software you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

SUFFIXES= .ctb .cbd .cld
EXTRA_DIST= yubin7.cbd yubin7.cld
dic_DATA= $(EXTRA_DIST)
EUCJPFILE=yubin7.ctd
CLEANFILES= $(EXTRA_DIST) $(EUCJPFILE)
dicdir= @CANNADICDIR@

$(dic_DATA): $(EUCJPFILE)

$(EUCJPFILE):
	$(top_srcdir)/yu2.PL --yubin=$(top_srcdir)/KEN_ALL.CSV --jigyosho=$(top_srcdir)/JIGYOSYO.CSV >$@

.ctd.cbd:
	$(MKBINDIC) $<

.ctd.cld:
	$(MKBINDIC) $<
