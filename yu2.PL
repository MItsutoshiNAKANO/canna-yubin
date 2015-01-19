#! /usr/bin/env perl

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
    print STDERR "usage: yu2.PL [--yubin=KEN_ALL.CSV] [--jigyosho=JIGYOSYO.CSV] [--ime={canna|wnn}]

If you want see more detail, type 'pod2text yu2.PL'.
";
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
    $seven =~ tr/0123456789/０１２３４５６７８９/;
    print "${seven} ${jusho} 地名 0\n";
}

sub printWNNjigyosho($$$)
{
    my ($seven, $jigyosho, $jusho) = @_;
    $seven =~ tr/0123456789/０１２３４５６７８９/;
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

=pod

=head1 NAME

yu2.PL - convert Japanese ZIP codes CSV files to Canna|(Free)Wnn's dictionary

=head1 SYNOPSIS

yu2.PL [--yubin=KEN_ALL.CSV] [--jigyosho=JIGYOSYO.CSV] [--ime={canna|wnn}]

=head1 DESCRIPTION

The yu2.PL is a program for converting from Japanese ZIP codes CSV files
to Canna|(Free)Wnn readable CSV files.

Japanese ZIP codes CSV files can get from JAPAN POST Co., Ltd.'s Web pages.

=head2 See

L<http://www.post.japanpost.jp/zipcode/dl/kogaki-zip.html>
L<http://www.post.japanpost.jp/zipcode/dl/jigyosyo/index-zip.html>

=head1 OPTIONS

=head2 --yubin=F<KEN_ALL.CSV>

Specify ZIP codes file.

=head2 --jigyosho=F<JIGYOSYO.CSV>

Specify office ZIP codes file.

=head2 --ime={canna|wnn}

Specify IME type.

=head3 Default

canna

=head1 FILES

=head2 F<KEN_ALL.CSV>

You can get from
L<http://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip>.

=head2 F<JIGYOSYO.CSV>

You can get from
L<http://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip>.

=head1 Copyright(C)

2001 Yoshito Komatsu <ykomatsu@akaumigame.org>

2014, 2015 Mitsutoshi NAKANO <bkbin005@rinku.zaq.ne.jp>

=head1 License

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published
by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to
the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
MA 02110-1301, USA.

=cut
