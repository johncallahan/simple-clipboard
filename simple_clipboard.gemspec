# coding: utf-8
# frozen_string_literal: true

require File.expand_path('lib/simple_clipboard/version', __dir__)

Gem::Specification.new do |s|
  s.name = 'simple_clipboard'
  s.version = SimpleClipboard::VERSION
  s.date = '2018-07-24'
  s.summary = 'Simple clipboard example gem'
  s.authors = ['Tristan Penman']
  s.email = 'tristan@tristanpenman.com'
  s.licenses = ['MIT']
  s.homepage = 'https://www.github.com/tristanpenman/simple-clipboard'

  s.extensions = ['ext/simple_clipboard/extconf.rb']
  s.files = [
    'ext/simple_clipboard/simple_clipboard.c',
    'lib/simple_clipboard.rb',
    'lib/simple_clipboard/version.rb'
  ]
  s.require_paths = ['lib']

  s.add_development_dependency "rake", '~> 12.3'
  s.add_development_dependency "rake-compiler", '~> 1.0'
  s.add_development_dependency "rspec", '~> 3.8'
end
