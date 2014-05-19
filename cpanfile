requires "File::Basename" => "0";
requires "File::ShareDir" => "0";
requires "File::Spec::Functions" => "0";
requires "Mojo::Base" => "0";

on 'test' => sub {
  requires "Mojolicious" => "0";
  requires "Test::Mojo" => "0";
  requires "Test::More" => "0";
  requires "Test::NoTabs" => "0";
  requires "strict" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
  requires "File::ShareDir::Install" => "0.06";
};

on 'develop' => sub {
  requires "Test::More" => "0";
  requires "Test::NoTabs" => "0";
};
