# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';
use strict;
use warnings;
use Test;
BEGIN { plan tests => 17 };
use Perl6::Binding;
ok(1);

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

sub test_arguments {
	my($zero,$one,@two,%three):=*@_;
	ok($one eq 'one');
	ok($two[0] eq 'two' && $two[1] eq 'three');
	ok($three{'one'} == 1 && $three{'two'} == 2);
	$zero = 'non-zero';
}

my $variable = 'zero';

test_arguments(
	$variable,
	'one',
	[ 'two', 'three' ],
	{ 'one' => 1, 'two' => 2 }
);

ok($variable eq 'non-zero');

package test_hash_methods;

sub new {
	bless {
		'one' => 'one',
		'two' => [ 'two', 'three' ],
		'three' => { 'one' => 1, 'two' => 2 }
	};
}

sub test {
	my ($self, $four, @five, %six) := *@_;
	main::ok(ref $self eq 'test_hash_methods'); 
	my ($one, @two, %three) := *%$self;
	main::ok($four eq 'four');
	main::ok($five[0] eq 'five' && $five[1] eq 'six');
	main::ok($six{'seven'} == 7 && $six{'eight'} == 8);
	main::ok($one eq 'one');
	main::ok($two[0] eq 'two' && $two[1] eq 'three');
	main::ok($three{'one'} == 1 && $three{'two'} == 2);
}

package main;

ok(1);		## package compiled OK

my $t = new test_hash_methods;

$t->test(
	'four',
	[ 'five', 'six' ],
	{ 'seven' => 7, 'eight' => 8 }
);

my $scalar1 = [ qw/one two three/ ];
my @array := @$scalar1;
ok($array[0] eq 'one' && $array[1] eq 'two' && $array[2] eq 'three');
my $scalar2 = { 'one' => 1, 'two' => 2, 'three' => 3 };
my %hash := %$scalar2;
ok($hash{'one'} == 1 && $hash{'two'} == 2 && $hash{'three'} == 3);
my $thirtyseven = "thirty-seven";
my $scalarx := $thirtyseven;
ok($scalarx eq 'thirty-seven');
my $scalar3 = \$thirtyseven;
my $scalar := $scalar3;
ok($$scalar eq 'thirty-seven');
