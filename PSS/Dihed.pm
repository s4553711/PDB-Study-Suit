package PSS::Dihed;
use utf8;
use strict;
use warnings;
use Data::Dumper;

sub new {
	my ($class,$set) = @_;
	my $self = bless({},$class);
	return $self;
}

sub stream_in {
	my ($self,$ref) = @_;

	foreach my $string (@$ref) {
		my @ar = split(' ',$string);
		my $res = '';
		my $resID = '';
		my $chain = '';
		my $phi = 0;
		my $psi = 0;
		my $omg = 0;
		my $chi1 = 0;

		for(my $i = 0; $i <= $#ar; $i++) {
			if ($i == 0) {
				if ($ar[$i] =~ /^([a-zA-Z]+)(\d+):(\S+)$/) {
					$res = $1;
					$resID = $2;
					$chain = $3;
				}
			} elsif ($i == 1) {
				$phi = $ar[$i];
			} elsif ($i == 2) {
				$psi = $ar[$i];
			} elsif ($i == 3) {
				$omg = $ar[$i];
			} elsif ($i == 4) {
				$chi1 = $ar[$i];
			}
		}

		push(@{$self->{mol}},{
			res => $res,
			resID => $resID,
			chain => $chain,
			phi => $phi,
			psi => $psi,
			omg => $omg,
			chi1 => $chi1	
		});
	}
}

sub getMol {
	my ($self) = @_;
	return $self->{mol};
}
1;
