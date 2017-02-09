#!perl
use warnings;
use strict;
use HTML::Template;
#=pod
#=head1 
#Este programa tomara del archivo passwd los usuarios, password, uid, gid,
#descripcion, home y shell y los pasara a un archivo con extancion html. 
print "Especifica la ruta de tu archivo passwd\n";
open FILE,">pru.html" or die "Error";
print FILE &showForm();
close FILE;
sub showForm{
		my $output;
		my $template = HTML::Template->new(filename => './templatee.tmpl');
		my $info=&datos($_[0]);
		my @loop_data=();
		while(@{$info->[0]}){
				my %row_data;
				$row_data{user}=shift @{$info->[0]};
				$row_data{pass}=shift @{$info->[1]};
				$row_data{uid}=shift @{$info->[2]};
				$row_data{gid}=shift @{$info->[3]};
				$row_data{desc}=shift @{$info->[4]};
				$row_data{home}=shift @{$info->[5]};
				$row_data{shell}=shift @{$info->[6]};

				push(@loop_data,\%row_data);
	
		}
		$template->param(pswd => \@loop_data);
		$output.=$template->output();
		#print $output;
		return $output;
}
#=head3
#se abre el archivo y se descompone cada linea con una expresion regular
#y posteriormente se guarda en arreglos y se hace referencia de cada arreglo,
#para despues ocupar en la subrutina  ShowForm.
sub datos{
	
	my $filen;
        chomp($filen=<STDIN>);
	open FL, "<", $filen;
	my @file=(<FL>);
	my @user;
	my @pass;
	my @uid;
	my @gid;
	my @desc;
	my @home;
	my @shell;
	
	foreach(@file){
		if(/(.*)\:(.*)\:(.*)\:(.*)\:(.*)\:(.*)\:(.*)/){
			push(@user, $1);	
			push(@pass, $2);
			push(@uid, $3);
			push(@gid, $4);
			push(@desc, $5);
			push(@home, $6);
			push(@shell, $7);
		}
	}
	my @info=(\@user,\@pass,\@uid,\@gid,\@desc,\@home,\@shell);
	close FL;
	return \@info;
}
