requires 'File::ShareDir';
requires 'Mojo::Base';

on test => sub {
  requires 'Test::More';
  requires 'Test::Mojo';
};

on build => sub {
  requires 'Test::More';
  requires 'Test::Mojo';
};
