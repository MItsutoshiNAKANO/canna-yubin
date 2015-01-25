#                                               -*- Autoconf -*-
# Copyright (C) 2015 Mitsutoshi NAKANO <bkbin005@rinku.zaq.ne.jp>
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

# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([canna-yubin], [0.3.0.20141226.0],
[canna-yubin-misc@lists.sourceforge.jp])
AM_INIT_AUTOMAKE

#

AC_ARG_WITH([canna],
[--with-canna	build Canna dictionary [[default=/var/lib/canna/dic/canna/]]],
[], [with_canna=yes])

AC_ARG_WITH([wnn], [--with-wnn	build Wnn dictionary [[default=no]]], [],
[with_wnn=no])

case "x$with_canna" in
'xno') ;;
'xyes') CANNADICDIR='/var/lib/canna/dic/canna/'	;;
*) CANNADICDIR="$with_canna" ;;
esac

case "x$with_wnn" in
'xno') ;;
'xyes') WNNDICDIR='/usr/local/lib/wnn/ja_JP/dic/yubin/'	;;
*) WNNDICDIR="$with_wnn" ;;
esac

AC_SUBST(IMES)
AC_SUBST(CANNADICDIR)
AC_SUBST(WNNDICDIR)

# Checks for programs.
AC_PROG_INSTALL
AC_PROG_MKDIR_P

case "x$with_canna" in
'xno') ;;
x*)
	AC_CHECK_PROGS(MKBINDIC, [mkbindic], [])
	case "x$MKBINDIC" in
	'x') AC_MSG_ERROR([could not find mkbindic.  Did you install Canna?]) ;;
	esac
	;;
esac

case "x$with_wnn" in
'xno') ;;
x*)
	AC_CHECK_PROGS(ATOD, [atod], [])
	case "x$ATOD" in
	'x') 
		AC_MSG_ERROR([could not find atod.  Did you install Wnn and set your PATH?  FreeWnn default, atod is installed /usr/local/bin/Wnn4/!])
		;;
	esac
	;;
esac

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.


AC_CONFIG_FILES([
                 Makefile
		 Canna/Makefile
		 Wnn/Makefile
		 ])
AC_OUTPUT
