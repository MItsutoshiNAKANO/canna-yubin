#!/usr/bin/perl
#
# yu2can - convert CSV file to Canna dictionary
#
#          by Yoshito Komatsu <yoshito.komatsu@nifty.com>
#

$yubinfile = './ken_all.csv';
$jigyoshofile = './jigyosyo.csv';

open (CSV, $yubinfile);
while (<CSV>) {
    $_ =~ tr/\"//d;
    my ($seven, $jusho);
    my @tmp;
    @tmp = split (/\,/, $_);
    $seven = $tmp[2];
    print "${seven} \#CN ";
    $jusho = $tmp[6] . $tmp[7] . $tmp[8];
    print "${jusho}\n";
}
close (CSV);

open (CSV, $jigyoshofile);
while (<CSV>) {
    $_ =~ tr/\"//d;
    my ($seven, $jusho);
    my @tmp;
    @tmp = split (/\,/, $_);
    $seven = $tmp[7];
    print "${seven} \#CN ";
    $jusho = $tmp[2] . " " . $tmp[3] . $tmp[4] . $tmp[5] . $tmp[6];
    my $len = length ($jusho);
    print "${jusho}\n";
}
close (CSV);
