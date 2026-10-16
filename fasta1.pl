#!/usr/bin/perl -w

use strict;

my $idsfile = "id.txt";
my $seqfile = "anu.dat";
my %ids = ();

open FILE, $idsfile or die "Cannot open $idsfile: $!";
while (<FILE>) {
    chomp;
    $ids{$_} += 1;
}
close FILE;

local $/ = "\n>";
open OUT, ">nucfinal.dat" or die "Cannot write to nucfinal.dat: $!";
open FASTA, $seqfile or die "Cannot open $seqfile: $!";

while (<FASTA>) {
    chomp;
    my $seq = $_;
    my ($id) = $seq =~ /^>*(\S+)/;

    if (exists($ids{$id})) {
        $seq =~ s/^>*.+\n//;
        $seq =~ s/\n//g;
        print OUT ">$id\n";
        print OUT "$seq\n";
    }
}

close FASTA;
close OUT;
