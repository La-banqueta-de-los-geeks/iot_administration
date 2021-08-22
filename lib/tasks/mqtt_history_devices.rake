require 'rubygems'
require 'mqtt'

namespace :mqtt_history_devices do

  desc "Publish messages"
  task publish: :environment do
    typos =  [:device,:device_port]
    # Publish example
    MQTT::Client.connect('test.mosquitto.org') do |c|
      100.times{ |i| c.publish(typos[rand(0..1)], "message_#{i}") }
      c.publish("test", "message_")
    end
  end

  desc "Subscribe messages"
  task subscribe: :environment do
    # If you pass a block to the get method, then it will loop
    $MOSQUITTO= MQTT::Client.connect('test.mosquitto.org') 
    $MOSQUITTO.subscribe( 'device' )
    $MOSQUITTO.subscribe( 'device_port' )
    $MOSQUITTO.subscribe( 'test' )
    $MOSQUITTO.get do |topic,message|
      case topic
      when "device"
        puts "____________ #{message}"
      when "device_port"
        puts "#{message}_____________"
      else 
        puts "#{topic}:#{message}"
      end
    end
    
  end 

end
