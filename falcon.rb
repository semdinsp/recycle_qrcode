#!/usr/bin/env -S falcon host
# frozen_string_literal: true

# set environment variable to ASYNC_CONTAINER_PROCESSOR_COUNT=8


#module Async::Container
#  def self.processor_count
    # was: ENV.fetch('FALCON_WORKERS') { Etc.nprocessors }
#    ENV.fetch('FALCON_WORKERS') { 3 }
#  rescue
#    3
#  end
# end
pcount=ENV.fetch('ASYNC_CONTAINER_PROCESSOR_COUNT',Etc.nprocessors)
puts "falcon processor count #{pcount} cores: #{Etc.nprocessors} set ASYNC_CONTAINER_PROCESSOR_COUNT env to override"


load :rack, :lets_encrypt_tls, :supervisor
myport=3000
myport=ENV['PORT'] if !ENV['PORT'].nil? and ENV['PORT']!=""
#puts "port set to [#{myport}] #{ENV.inspect}"
puts "port set to [#{myport}]"
hostname = File.basename(__dir__)
rack hostname, :lets_encrypt_tls do
	cache true
  endpoint Async::HTTP::Endpoint.parse("http://0.0.0.0:#{myport}").with(protocol: Async::HTTP::Protocol::HTTP11)
 # endpoint Async::HTTP::Endpoint.parse("http://0.0.0.0:#{myport}").with(protocol: Async::HTTP::Protocol::HTTP2)

  #endpoint Async::HTTP::Endpoint.parse("http://0.0.0.0:#{myport}").with(protocol: Async::HTTP::Protocol::HTTP2)
end

supervisor
