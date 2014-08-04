# Copyright (C) 2001 Yoshito Komatsu
#               2014 Mitsutoshi NAKANO <bkbin005@rinku.zaq.ne.jp>
#
# This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

DESTDIR=
DICS=yubin7.cbd yubin7.cld

canna-yubin:
	./yu2can.pl > yubin7.ctd.tmp
	nkf -e yubin7.ctd.tmp > yubin7.ctd
	mkbindic yubin7.ctd

cleantmp:
	rm -f yubin7.ctd yubin7.ctd.tmp

clean: tmpclean
	rm -f $(DICS)

install:
	install -m 644 ${DICS} ${DESTDIR}/var/lib/canna/dic/canna
