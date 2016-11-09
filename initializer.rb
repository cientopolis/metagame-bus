require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

Figaro.application = Figaro::Application.new(environment: 'development', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

