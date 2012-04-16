package Catalyst::Helper::View::Image::Empty;
use strict;
 
 
sub mk_compclass {
    my ( $self, $helper ) = @_;
    my $file = $helper->{file};
    $helper->render_file( 'compclass', $file );
}
 
 
1;
 
L<[% app %]>
 
=head1 LICENSE
 
This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself. This software comes "as it is" with absolutely no warranty.
 
=cut
 
1;