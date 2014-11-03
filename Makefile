#! /usr/bin/make -f
# Copyright (C) 2001 Yoshito Komatsu
#               2014 Mitsutoshi NAKANO <bkbin005@rinku.zaq.ne.jp>
#
# This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

MKDIR_P=mkdir -p
DESTDIR=
DICS=yubin7.cbd yubin7.cld

build:
	diff COPYING debian/copyright
	./yu2.PL >yubin7.ctd
	mkbindic yubin7.ctd

cleantmp:
	rm -f yubin7.ctd

clean: cleantmp
	rm -f $(DICS)

install:
	$(MKDIR_P) ${DESTDIR}/var/lib/canna/dic/canna
	install -m 644 ${DICS} ${DESTDIR}/var/lib/canna/dic/canna
