# -*- encoding: utf-8 -*-
require File.expand_path('../lib/message/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Prasath Venkatraman"]
  gem.email         = ["ask4prasath@gmail.com"]
  gem.description   = 'Ruby implementation of Publish subscribe design pattern'
  gem.summary       = 'Ruby implementation of Publish subscribe design pattern'
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "message-pubsub"
  gem.require_paths = ["lib"]
  gem.version       = Message::PubSub::VERSION
end
