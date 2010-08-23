# encoding: utf-8

# Add lib/ to the load path.
$LOAD_PATH.unshift File.dirname(__FILE__)

# === Core Libraries =========================================================

require 'date'
require 'pathname'
require 'yaml'

# The Gob Namespace Module
module Gob
  # The absolute path of the gob/ directory in lib/.
  def self.root
    @root ||= Pathname.new(File.expand_path(File.dirname(__FILE__))) + 'gob'
  end

  # Returns the current environment as a symbol.
  def self.env
    @env ||= (ENV['RACK_ENV'] or :production).to_sym
  end
end

# === Off we go... ===========================================================

require 'rubygems'
require 'bundler'

Bundler.setup
Bundler.require(:default, :test)#Gob.env)

# === Application Sources ====================================================

require 'rack/gob_dispatcher'
require 'gob/apps'

