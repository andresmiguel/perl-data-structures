use 5.014;
use strict;
use warnings;
use PriorityQueue;

use Test::More 'no_plan';

sub max_cmp {
	my ($x, $y) = @_;
	$x <=> $y;
}

# create a max priority queue
my $max_pq = PriorityQueue->new(\&max_cmp);

ok($max_pq->isEmpty(), "The queue is empty");
is($max_pq->peek(), undef, "The peek should return undef when the queue is empty.");
is($max_pq->dequeue(), undef, "The dequeue should return undef when the queue is empty.");

# add en element to the queue
$max_pq->enqueue(10);

ok(!$max_pq->isEmpty(), "The queue is not empty");

# add 4 more elements to the queue

$max_pq->enqueue(1);
$max_pq->enqueue(2);
$max_pq->enqueue(7);
$max_pq->enqueue(3);

ok($max_pq->peek() == 10, "The element on the top should be 10.");
ok($max_pq->dequeue() == 10, "The extracted element should be 10.");
ok(!$max_pq->isEmpty(), "The queue is not empty");
ok($max_pq->dequeue() == 7, "The extracted element should be 7.");
ok($max_pq->dequeue() == 3, "The extracted element should be 3.");
ok($max_pq->dequeue() == 2, "The extracted element should be 2.");
ok($max_pq->dequeue() == 1, "The extracted element should be 1.");
ok($max_pq->isEmpty(), "The queue is empty");
