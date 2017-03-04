package PriorityQueue;

use 5.014;
use strict;
use warnings;

sub new {
	my ($class, $cmp_func) = @_;
	my $self = {cpm_func => $cmp_func};
	bless $self, $class;
}

sub isEmpty {
	
}

sub enqueue {
	
}

sub peek {
	
}

sub dequeue {
	
}

1;