#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 5;
use Glib::JSON;

{
    my $node = Glib::JSON::Node->new('null');
    is($node->get_node_type(), 'null', 'null node');
}

{
    my $node = Glib::JSON::Node->new('value');
    is($node->get_node_type(), 'value', 'string node (new)');
    $node->set_string("json");
    is($node->get_string(), 'json', 'string node contains "json"');
}

{
    my $node = Glib::JSON::Node->alloc();
    $node->init_string("json");
    is($node->get_node_type(), 'value', 'string node (alloc)');
    $node->init_boolean(1);
    is($node->get_node_type(), 'value', 'boolean node (alloc)');
}
