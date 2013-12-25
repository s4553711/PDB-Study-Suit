#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use local::lib;
use Data::Dumper;
#use Bio::PDB::Structure;
use Getopt::Std;

my %opts = ();
getopt("f:",\%opts);

if (defined $opts{f} && $opts{f} ne '') {
	my @result = system("dihed.pl -list phi,psi,omega,chi1 $opts{f}");
	foreach my $e (@result){
		print "$e";
	}
} else {
	print "Log> Unknow PDB File\n";
}

#LEU347:A  -89.137  118.124 -179.582 -178.111
#
sub torsion {
	my ($string) = @_;
	my @ar = split(' ',$string);
	for(my $i = 0; $i <= $#ar; $i++) {
		print "$i> $ar[$i]\n";
	}
}
