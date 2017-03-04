package PriorityQueue;

use 5.014;
use strict;
use warnings;

use Carp qw(croak);

sub new {
	my ($class, $cmp_func) = @_;
	croak "class name needed" if ref($class);
	
	my $self = {cpm_func => $cmp_func};
	bless $self, $class;
}

sub isEmpty {
	ref(my $self = shift) or croak "instance variable needed";	
}

sub enqueue {
	ref(my $self = shift) or croak "instance variable needed";
}

sub peek {
	ref(my $self = shift) or croak "instance variable needed";
}

sub dequeue {
	ref(my $self = shift) or croak "instance variable needed";
}

1;