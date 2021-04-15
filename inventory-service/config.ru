require "bundler/setup"
require_relative './config/boot'

run HttpApp.new
