package Skryf::Theme::Booshka;
# ABSTRACT: Base theme for Skryf

use Mojo::Base 'Mojolicious::Plugin';
use File::Basename 'dirname';
use File::Spec::Functions 'catdir';
use File::ShareDir ':ALL';

sub register {
    my ($self, $app) = @_;
    ############################################################################
    # Theme Metadata
    ############################################################################
    $app->helper(
        theme => sub {
            my $self = shift;
            return {
                'name'              => 'Booshka',
                'author'            => 'Adam Stokes',
                'license'           => 'Perl_5',
                'description'       => 'The default Skryf theme.',
                'plugins_supported' => ['Blog', 'Launchpad'],
                'version'           => $Skryf::Theme::Booshka::VERSION
            };
        }
    );

    ############################################################################
    # Add templates/static files to the renderer/static paths namespaces
    ############################################################################
    push @{$app->renderer->paths},
      catdir(dist_dir('Skryf-Theme-Booshka'), 'templates');
    push @{$app->static->paths},
      catdir(dist_dir('Skryf-Theme-Booshka'), 'public');

    push @{$app->renderer->classes}, __PACKAGE__;
    push @{$app->static->classes},   __PACKAGE__;

}

1;
__END__

=head1 SYNOPSIS

    use Skryf::Theme::Booshka;

=head1 DESCRIPTION

Skryf::Theme::Booshka is a base theme for Skryf

=head1 HELPERS

=head2 theme

This should be overriden in each plugin and at minimum contain

    name, author, license, description, plugins_supported, version

=cut
