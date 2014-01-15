package Skryf::Theme::Booshka;

use Mojo::Base 'Mojolicious::Plugin';
use File::Basename 'dirname';
use File::Spec::Functions 'catdir';
use File::ShareDir ':ALL';

our $VERSION = '0.02';

has theme_name => 'Booshka';
has theme_author => 'Adam Stokes';
has theme_license => 'Perl_5';
has theme_description => 'A simple base theme for Skryf.';
has plugins_supported => sub { my $self =shift; ['Blog', 'Admin', 'Search'] };

sub register {
    my ($self, $app, $config) = @_;

    push @{$app->renderer->paths}, catdir(dist_dir('Skryf-Theme-Booshka'), 'templates');
    push @{$app->static->paths},   catdir(dist_dir('Skryf-Theme-Booshka'), 'public');

    push @{$app->renderer->classes}, __PACKAGE__;
    push @{$app->static->classes},   __PACKAGE__;

}

1;
__END__

=encoding utf-8

=head1 NAME

Skryf::Theme::Booshka - Base theme for Skryf

=head1 SYNOPSIS

  use Skryf::Theme::Booshka;

=head1 DESCRIPTION

Skryf::Theme::Booshka is a base theme for Skryf

=head1 AUTHOR

Adam Stokes E<lt>adamjs@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2013-2014 Adam Stokes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
