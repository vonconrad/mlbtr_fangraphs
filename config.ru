require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'nokogiri'
require 'cabinet'
require 'open-uri'
require 'public/app'
require 'public/xml'

run Sinatra::Application