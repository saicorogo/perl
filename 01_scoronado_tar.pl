#!perl
use warnings;
use strict;
=pod
=head1
Lo que se hace en este programa es pasar solo los numeros primos de un arreglo 
a otro, es decir el primer arreglo contiene del 1 al 20 y el segundo solo tedra
los numeros primos dentro de ese rango.
=f
Se tiene un foreach el cual se aplica para todos los elementos del arreglo a
si se cumple la condicion dentro del if, los elementos se pasaran al arreglo b
por medio de la funcion push. Finalmente se imprime el arreglo, aplicando un funcion join que junta cada uno de los elementos del arreglo con el salto de linea.
  

=cut
my @a=(1..20);
my @b=();
foreach (@a){
	if(not(($_%2==0)||($_%3==0)||($_%5==0)||($_%7==0))||($_==2)||($_==3)||($_==5)||($_==7)){
	push(@b,$_);	
	}
}	
print join("\n",@b);
print "Un modulo especial que se utiliza en el momento de compilacion,pudiendo afectar la fase de ejecucion";
print "\n sirven para dar consejo al compilador, sobre algunas instrucciones, estos se activan anteponiendo use"
