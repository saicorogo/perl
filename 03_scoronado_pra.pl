#!/usr/bin/perl

use warnings;
use strict;
my %Ope = (
	suma  => \&suma,
	resta => \&resta,
	division => \&division,
	multi => \&multi,
	help => \&help,
	mod =>  sub{
	       return$_[0]%$_[1];
     	       },
);
my $op;
my $va1;
my $va2;
my @p;
while(1){
chomp($op=<STDIN>);
if($op eq "salir"){
	print "resultados";
	for(@p){
	print $_ , ",";
	}
	exit
}

 elsif($Ope{lc $op}){
	chomp($va1=<STDIN>);
	chomp($va2=<STDIN>);
        # $Ope{lc $op}-> ($_[0],$_[1]);
	
	push(@p,$Ope{lc $op}-> ($va1,$va2));
	#print (@p);
  }
  else {
    warn "no lo se";
  }
 

}
sub suma{
return $_[0]+$_[1]; 
}

sub resta{ 
return $_[0]-$_[1];
}

sub multi{ 
return $_[0]*$_[1];

}

sub division{  
 if ($_[1]==0){
 print "no es valido, no se puede dividir";
}
if (($_[0]>0)&& ($_[1]>0)){
return $_[0]/$_[1];
}}

sub help{
	print "Este programa realiza suma, resta, multiplicacion, division y modulo de dos numeros";
}
