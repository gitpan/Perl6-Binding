# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';
use strict;
use warnings;
use Test;
BEGIN { plan tests => 10 };
use Perl6::Binding;
ok(1);

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

##
## This module tests some advanced stuff.
##

my %sample = (
	'one' => 1,
	'two' => 2,
	'three' => {
		'four' => 4,
		'five' => 5,
		'six' => {
			'option1' => {
				'seven' => 7,
				'eight' => 8,
				'nine' => 9,
			},
		},
	},
);

my %hash := %{$sample{'three'}->{'six'}->{'option1'}};
ok($hash{'seven'} == 7);
ok($hash{'eight'} == 8);
ok($hash{'nine'} == 9);

$hash{'eight'} = 'otto';
ok($sample{'three'}->{'six'}->{'option1'}->{'eight'} eq 'otto');

my ($seven, $eight, $nine) := *%hash;
ok($eight eq 'otto');

my @array = (0 .. 7);
my $two := $array[2];

ok($two == 2);

$two = 'zwei';

ok($array[2] eq 'zwei');

my $one := $sample{'one'};
ok($one == 1);
$one = 'ein';
ok($sample{'one'} eq 'ein');
