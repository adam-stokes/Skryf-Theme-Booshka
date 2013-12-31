package App::skryf::Theme::Booshka;

use Mojo::Base 'Mojolicious::Plugin';
use File::Basename 'dirname';
use File::Spec::Functions 'catdir';

# VERSION

has theme_name => 'Booshka';
has theme_author => 'Adam Stokes';
has theme_license => 'MIT';
has theme_description => 'A simple base theme for Skryf.';
has plugins_supported => ['Blog', 'Wiki', 'Admin', 'Search'];

sub register {
    my ($self, $app, $config) = @_;
    my $base = catdir(dirname(__FILE__), 'Booshka');
    push @{$app->renderer->paths}, catdir($base, 'templates');
    push @{$app->static->paths},   catdir($base, 'public');

    push @{$app->renderer->classes}, __PACKAGE__;
    push @{$app->static->classes},   __PACKAGE__;

}

1;
__END__

=encoding utf-8

=head1 NAME

App::skryf::Theme::Booshka - Base theme for Skryf

=head1 SYNOPSIS

  use App::skryf::Theme::Booshka;

=head1 DESCRIPTION

App::skryf::Theme::Booshka is a base theme for Skryf

=head1 AUTHOR

Adam Stokes E<lt>adamjs@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2013- Adam Stokes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
