module Message
  module Handler
    def subscribe(event, block = Proc.new {})
      Message::PubSub.subscribe(self, event)
      define_singleton_method(event) { |args| block.call(args) }
    end
  end

  class PubSubError < StandardError;end

  class PubSub
    cattr_accessor :queue
    self.queue = HashWithIndifferentAccess.new

    class << self
      def subscribe(subscriber, event)
        queue[event] = Array.wrap(queue[event]).push(subscriber)
      end

      def publish(event, message)
        queue[event].each { |subscriber| subscriber.send(event, message) } && true
        rescue Exception => e
          raise Message::PubSubError.new({:error => e})
      end

      def subscribers
        queue.keys
      end

      def has_subscribers?
        subscribers.size > 0
      end
    end
  end
end







