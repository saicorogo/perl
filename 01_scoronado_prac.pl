#!perl
use warnings;
use strict;

my @a=(1..10);
my @b=();
my $c=0; 	
foreach (@a){
	if(($_%2)==0){
      	 $b[$c]=$_;
	 $c=$c+1;
	 }
	 }
	 print @b;
