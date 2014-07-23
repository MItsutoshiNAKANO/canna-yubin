DESTDIR=
DICS=yubin7.cbd yubin7.cld

canna-yubin:
	./yu2can.pl > yubin7.ctd.tmp
	nkf -e yubin7.ctd.tmp > yubin7.ctd
	mkbindic yubin7.ctd

clean:
	rm -f yubin7.c[tbl]d
	rm -f yubin7.ctd.tmp

install:
	install -m 644 ${DICS} ${DESTDIR}/var/lib/canna/dic/canna
