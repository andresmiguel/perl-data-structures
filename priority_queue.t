use 5.014;
use strict;
use warnings;
use PriorityQueue;

use Test::More 'no_plan';

# create a max priority queue
my $max_pq = PriorityQueue->new(
	\sub {
		my ($x, $y) = @_;
		$x <=> $y;	
	}
);

is($max_pq->isEmpty, "The queue is empty");

# add en element to the queue
$max_pq->enqueue(10);

isnt($max_pq->isEmpty, "The queue is not empty");

# add 4 more elements to the queue

$max_pq->enqueue(1);
$max_pq->enqueue(2);
$max_pq->enqueue(7);
$max_pq->enqueue(3);

ok($max_pq->peek() == 10, "The element on the top should be 10.");
ok($max_pq->dequeue() == 10, "The extracted element should be 10.");
isnt($max_pq->isEmpty(), "The queue should not be empty.");
ok($max_pq->dequeue() == 7, "The extracted element should be 7.");
ok($max_pq->dequeue() == 3, "The extracted element should be 3.");
ok($max_pq->dequeue() == 2, "The extracted element should be 2.");
ok($max_pq->dequeue() == 1, "The extracted element should be 1.");
is($max_pq->isEmpty, "The queue should be empty");
isnt(defined $max_pq->peek(), "The peek should return undef when the queue is empty.");
isnt(defined $max_pq->dequeue(), "The dequeue should return undef when the queue is empty.");
