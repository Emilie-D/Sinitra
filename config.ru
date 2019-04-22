require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

require 'controller'

run ApplicationController #exécute le contenu de la classe ApplicationController