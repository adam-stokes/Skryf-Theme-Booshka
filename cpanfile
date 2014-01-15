requires 'File::Basename';
requires 'File::ShareDir';
requires 'File::Spec::Functions';
requires 'Mojolicious';
requires 'version';

on test => sub {
  requires 'Test::More';
  requires 'Test::Mojo';
};

on build => sub {
  requires 'Test::More';
  requires 'Test::Mojo';
};
