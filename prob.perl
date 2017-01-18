#!/usr/bin/perl -w

#update to github at 2017-1-18

#use strict;
use warnings;
use English qw<$OS_ERROR>; # $!

my $beg=0;
my $end=200;
my $step=10;

open( my $input, '<', 'inter-H.dat' ) or die $OS_ERROR;

my @data;
while ( <$input> ) { 
    push @data, [ split ]; # split = split( ' ', $_ )
}

my @filter;
my @val;

for (my $q=$beg;$q<=$end;$q+=$step){
	my $low=$q;
	my $up=$q+$step;
	@filter=grep{$_->[0]>=$low && $_->[0]<$up}@data;
	@val=map{$filter[$_][1]} (0..$#filter);
	printf "%d\t%.5f\t%.5e\n",$q,mean(@val),var(@val);
}

sub mean { 
my(@numbers) = @_; 
#Prevent division by 0 error in case you get junk data 
return undef unless(scalar(@numbers)); 

# Step 1, find the mean of the numbers 
my $total = 0;  
foreach my $num (@numbers) { 
$total += $num; 
} 
my $mean = $total / (scalar @numbers);

return $mean;
}

sub var { 
my(@numbers) = @_; 
#Prevent division by 0 error in case you get junk data 
return undef unless(scalar(@numbers)); 

# Step 1, find the mean of the numbers 
my $total1 = 0; 
foreach my $num (@numbers) { 
$total1 += $num; 
} 
my $mean1 = $total1 / (scalar @numbers); 

# Step 2, find the mean of the squares of the differences 
# between each number and the mean 
my $total2 = 0; 
foreach my $num (@numbers) { 
$total2 += ($mean1-$num)**2; 
} 
my $var = $total2/ (scalar @numbers) ;

return $var; 
}  
