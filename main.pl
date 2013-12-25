#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use local::lib;
use Data::Dumper;
#use Bio::PDB::Structure;
use Getopt::Std;
use PSS::Dihed;

my %opts = ();
my $dihed = PSS::Dihed->new();
getopt("f:",\%opts);

if (defined $opts{f} && $opts{f} ne '') {
	my @result = `dihed.pl -list phi,psi,omega,chi1 $opts{f}`;
	$dihed->stream_in(\@result);
	print Dumper($dihed->getMol());
} else {
	print "Log> Unknow PDB File\n";
}
