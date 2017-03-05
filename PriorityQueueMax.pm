package PriorityQueueMax;

use 5.014;
use strict;
use warnings;

use Carp qw(croak);

sub new {
	my $class = shift;
	croak "class name needed" if ref($class);
	
	my $self = {
		heap => [],
		size => 0
	};
	bless $self, $class;
}

sub isEmpty {
	ref(my $self = shift) or croak "instance variable needed";
	return ($self->{size} == 0); 
}

sub enqueue {
	ref(my $self = shift) or croak "instance variable needed";
	
	my $index = $self->{size};
	$self->{heap}[$index] = shift;
	$self->{size}++;
	
	return 1 if $index == 0; # first insertion
	my $parent;
	do {
		$parent = int(($index - 1) / 2);
		if ($self->{heap}[$index] > $self->{heap}[$parent]) {
			($self->{heap}[$index], $self->{heap}[$parent]) = ($self->{heap}[$parent], $self->{heap}[$index]);
			$index = $parent;
		} else {
			return 1;
		}		
	} while ($parent != 0);
	
}

sub peek {
	ref(my $self = shift) or croak "instance variable needed";
	return undef if $self->isEmpty();
	return $self->{heap}[0];
}

sub dequeue {
	ref(my $self = shift) or croak "instance variable needed";
	return undef if $self->isEmpty();
	
	sub heapify;
		
	my $root = $self->{heap}[0];
	&heapify($self);
	return $root;
	
	sub heapify {
		my $self = shift;
		$self->{size}--;
		$self->{heap}[0] = $self->{heap}[$self->{size}]; 
		$self->{heap}[$self->{size}] = undef;
		
		my $root = 0;
		my ($left, $right);
		while (1) {
			$left = 2 * $root + 1;
			$right = 2 * $root + 2;
			
			last if !defined($self->{heap}[$left]);
			
			my $max;
			if (!defined($self->{heap}[$right])) {
				$max = $left;
			} else {
				$max = $self->{heap}[$left] > $self->{heap}[$right]
					? $left
					: $right;
			}
			
			if ($self->{heap}[$max] > $self->{heap}[$root]) {
				($self->{heap}[$max], $self->{heap}[$root]) = ($self->{heap}[$root], $self->{heap}[$max]);
				$root = $max;
			} else {
				last;
			}
		}
		
	}
}

1;