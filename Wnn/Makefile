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
DESTDIR?=/usr/local
WNNDICS=yubin7.dic
WNNDICDIR=yubin
WNNDICPATH=${DESTDIR}/lib/wnn/ja_JP/dic/${WNNDICDIR}

build: yubin7.dic

yubin7.dic: yubin7.u
	atod -s 200000 yubin7.dic <yubin7.u

yubin7.u: ../KEN_ALL.CSV ../JIGYOSYO.CSV
	../yu2.PL --yubin=../KEN_ALL.CSV --jigyosho=../JIGYOSYO.CSV  --ime=wnn >yubin7.u

cleantmp:
	rm -f yubin7.u

clean: cleantmp
	rm -f $(WNNDICS)

install:
	$(MKDIR_P) ${WNNDICPATH}
	install -m 644 ${WNNDICS} ${WNNDICPATH}
