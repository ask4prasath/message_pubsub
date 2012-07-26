# Message::Pubsub

A simple Ruby implementation of publish subscribe design pattern.

## Installation
$ gem install message-pubsub

## Simple Example
```ruby
require 'message-pubsub'
class Foo
  extend Message::Handler
  subscribe :something, lambda { |message| puts message } #Subscibes to event something
end

class Bar
  extend Message::Handler
  subscribe :something, lambda { |message| puts message } #Subscibes to same event something
end

 Message::PubSub.publish(:something, "foo bar")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


