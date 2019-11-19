#!/usr/bin/env perl
use Mojolicious::Lite;
use Mojo::mysql;

plugin 'yaml_config';
plugin Yancy => app->config;

app->yancy->plugin( 'Auth::Password' => {
    schema => 'users',
    username_field => 'username',
    password_field => 'password',
    password_digest => {
        type => 'SHA-1',
    },
} );

get '/config' => sub {
    my $c = shift;
    $c->render( json => { status => 'ok', config => app->config } );
};

app->start;
