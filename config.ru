# encoding: utf-8

$:.unshift ::File.expand_path("#{::File.dirname(__FILE__)}/lib")
require "gob"

run Rack::GobDispatcher

