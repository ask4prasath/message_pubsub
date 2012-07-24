require 'spec_helper'

describe 'Message::PubSub' do

  it 'should have a default queue' do
    Message::PubSub.queue.should eq(HashWithIndifferentAccess.new())
  end

  it 'should subscribe events' do
    Message::PubSub.subscribe(TestSubscriber, :complete)
    Message::PubSub.subscribers.should eq(['complete'])
  end

  it 'should return num of subscribers' do
    Message::PubSub.subscribe(TestSubscriber, :complete)
    Message::PubSub.has_subscribers?.should be_true
  end

  context 'Message pubsub Publish' do
    before(:all) do
      class Foo
        extend Message::Handler
        subscribe :something, lambda { |message| receive_message(message) }

        def self.receive_message(message)
          message
        end
      end
    end

    it 'should receive message when it is subscribed' do
      Foo.expects(:receive_message).with("foo bar")
      Message::PubSub.publish(:something, "foo bar")
    end
  end

end