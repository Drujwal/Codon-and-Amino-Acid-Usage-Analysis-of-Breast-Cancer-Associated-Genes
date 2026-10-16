#!/usr/bin/perl -w

# Input FASTA file
$ujwal = "ABC.fa";

# Open input file safely
open(file1, "$ujwal") or die "Cannot open $ujwal: $!";
@line = <file1>;
close(file1);

# Initialize counters
$n = @line;
$l = $n - 1;
$a = 0;
$b = 1;

# Process lines
foreach $i (0 .. $l) {
    print "$i\n";
    chomp($line[$i]);  # remove trailing newline if present
    @new = split(//, $line[$i]);

    if ($new[0] eq ">") {
        $a++;
        $take[$i]  = ">nuc_$a\n";
        $store[$i] = "nuc_$a";
        $index[$b] = "$store[$i]";
        $b++;
        $index[$b] = "\t";
        $b++;
        $index[$b] = "$line[$i]\n";
        $b++;
    } else {
        $take[$i] = "$line[$i]\n";
    }
}

# Write renamed FASTA file
$anu = "anu.txt";
open(file2, ">$anu") or die "Cannot write to $anu: $!";
print file2 @take;
close(file2);

# Write index file
$plosanu = "plosanu.txt";
open(file3, ">$plosanu") or die "Cannot write to $plosanu: $!";
print file3 @index;
close(file3);

# Final messages
print "TASK ACCOMPLISHED\n";
print "$a\n";
