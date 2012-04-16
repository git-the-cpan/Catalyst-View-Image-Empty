package Catalyst::View::Image::Empty;

use strict;
use warnings;

use Moose;

extends 'Catalyst::View';

use Image::Empty;

has format => ( is => 'rw', isa => 'Str', default => 'gif' );

=head1 NAME

Catalyst::View::Image::Empty - View to return a 1x1 empty GIF, used with tracking URLs

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

$VERSION = eval $VERSION;

=head1 SYNOPSIS

Catalyst::View::Image::Empty is a view that returns a 1x1 empty Gif for use in tracking URLs.

=cut

=head1 USAGE

=head2 Create View

 script/myapp_create.pl view Image::Empty Image::Empty

=head2 In Your Controller

 sub tracker :Local
 {
         my ( $self, $c ) = @_;
         
         $c->detach('View::Image::Empty');
 }

=cut

sub process
{
	my ( $self, $c ) = @_;

	my $format = $self->format;
		
	my $empty = Image::Empty->$format;
   
	$c->response->content_type( $empty->type );
	$c->response->content_length( $empty->length );
	$c->response->header( 'Content-Disposition' => $empty->disposition . '; filename="' . $empty->filename . '"' );

	$c->response->body( $empty->content ); 
}

=head1 SEE ALSO

L<Image::Empty>

=head1 AUTHOR

Rob Brown, C<< <rob at intelcompute.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-catalyst-view-image-empty at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Catalyst-View-Image-Empty>.  I will be notified, and then you will
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Catalyst::View::Image::Empty


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Catalyst-View-Image-Empty>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Catalyst-View-Image-Empty>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Catalyst-View-Image-Empty>

=item * Search CPAN

L<http://search.cpan.org/dist/Catalyst-View-Image-Empty/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2012 Rob Brown.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of Catalyst::View::Image::Empty

