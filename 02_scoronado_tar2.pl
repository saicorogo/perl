
#!perl
use strict;
use warnings;
use 5.014;
=pod 
my $file = <STDIN>;
my $salida ='salida.txt';
my $i;
my $c=0;
my @e=();
my @v=();
=head1
Lo que se intenta hacer en este programa es mostrar las coincidencias de diferentes dominios
y correos, teniendo como entrada un archivo y como salida otro archivo.
open(FCG,  $file) or die "No se puede\n";
my @content = <FCG>;
open(FH, '>', $salida) or die "EROR '$file' $!";
=head2
Se abre los dos archivos que se ocuparan y en seguda se realiza un while mientras sea 
verdadero el gestor de archivo se hace un foreach para que busque en todo el archivo y se 
aplica un if para cada caso con su respectiva condicion.
while(<FCG>){
        chomp;

	foreach (@content) {
		if ($_ = /https?:\/\//){
                	push(@v,$');
             		$i++ if ($' =~ @v[$c]);  #palabra que deseas buscar
             		$c=$c+1;
			print FH  'El dominio' .$'. 'se repite' .$i. 'veces del archivo' .$file;
}
		if(/([a-zA-Z0-9i|\.|-|_]*@[a-zA-Z0-9|\.|-|_]*\.[a-zA-Z]{2,4})/){
   			 push(@e,$1);
   			 $i++ if ($1 =~ @e[$c]);  #palabra que deseas buscar
		 	 $c=$c+1;			
   			 print FH $1,"\n"
}
}
}

print FH "Escribir\n";
close(FCG);
close (FH);
=head3 
se cierran los archivos
=cut
