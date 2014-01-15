package Skryf::Theme::Booshka;

use Mojo::Base 'Mojolicious::Plugin';
use File::Basename 'dirname';
use File::Spec::Functions 'catdir';
use File::ShareDir ':ALL';

our $VERSION = '0.02';
$VERSION = eval $VERSION;

sub register {
    my ($self, $app) = @_;
    ###########################################################################
    # Theme Metadata
    ###########################################################################
    $app->helper(
        theme => sub {
            my $self = shift;
            return {
                'name'              => 'Booshka',
                'author'            => 'Adam Stokes',
                'license'           => 'Perl_5',
                'description'       => 'The default Skryf theme.',
                'plugins_supported' => ['Blog', 'Launchpad'],
                'version'           => $VERSION,
            };
        }
    );

    ###########################################################################
    # Add templates/static files to the renderer/static paths namespaces
    ###########################################################################
    push @{$app->renderer->paths},
      catdir(dist_dir('Skryf-Theme-Booshka'), 'templates');
    push @{$app->static->paths},
      catdir(dist_dir('Skryf-Theme-Booshka'), 'public');

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
