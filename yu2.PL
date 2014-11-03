#! /usr/bin/env perl
#
# Copyright (C) 2001 Yoshito Komatsu
#               2014 Mitsutoshi NAKANO <bkbin005@rinku.zaq.ne.jp>
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to
# the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.
#
# yu2.PL - convert CSV file to Canna|Wnn dictionary

use strict;
use warnings;
use utf8;
use Getopt::Long;

use constant {
    CANNA => 'canna',
    WNN => 'wnn',
};

sub usage()
{
    print STDERR "usage: yu2.PL [--yubin KEN_ALL.CSV] [--jigyosho JIGYOSYO.CSV] [--ime={canna|wnn}]";
    exit(2);
}

sub printCANNAyubin($$)
{
    my ($seven, $jusho) = @_;
    print "${seven} \#CN ${jusho}\n";
}

sub printCANNAjigyosho($$$)
{
    my ($seven, $jigyosho, $jusho) = @_;
    print "${seven} \#CN ${jigyosho} ${jusho}\n";
}

sub printWNNyubin($$)
{
    my ($seven, $jusho) = @_;
    print "${seven} ${jusho} 地名 0\n";
}


sub printWNNjigyosho($$$)
{
    my ($seven, $jigyosho, $jusho) = @_;
    print "${seven} ${jigyosho} 地名 0\n";
    print "${seven} ${jusho} 地名 0\n";
}



my ($yubin, $jigyosho, $ime) = ('./KEN_ALL.CSV', './JIGYOSYO.CSV', CANNA);
GetOptions(
    "yubin=s" => \$yubin,
    "jigyosho=s" => \$jigyosho,
    "ime=s" => \$ime,
    ) or usage();

my ($printlineYubin, $printlineJigyosho)
    = (\&printCANNAyubin, \&printCANNAjigyosho);
if ("$ime" eq WNN) {
    $printlineYubin = \&printWNNyubin;
    $printlineJigyosho = \&printWNNjigyosho
} elsif ("$ime" eq CANNA) {
} else { usage(); };


binmode STDOUT, ':encoding(EUC-JP)';

open(CSV, $yubin);
binmode CSV, ':encoding(Shift_JIS)';
while (<CSV>) {
    $_ =~ tr/\"//d;
    my @tmp = split (/\,/, $_);
    &$printlineYubin($tmp[2], "$tmp[6]$tmp[7]$tmp[8]");
}
close (CSV);

open(CSV, $jigyosho);
binmode CSV, ':encoding(Shift_JIS)';
while (<CSV>) {
    $_ =~ tr/\"//d;
    my @tmp = split (/\,/, $_);
    &$printlineJigyosho("$tmp[7]", "$tmp[2]", "$tmp[3]$tmp[4]$tmp[5]$tmp[6]");

}
close (CSV);
