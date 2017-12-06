require 'rack'
require "maf/version"

require "maf/server"
require "maf/config"
require "maf/route"
require "maf/routes"
require "maf/env"
require "maf/renderer"

require "maf/dsl/routing"
require "maf/dsl/rendering"

module Maf
  class << self
    def start(app)
      Rack::Handler::WEBrick.run(app)
    end

    def config
      @config ||= Config.new
    end

    # @example
    #   Maf.routing do
    #     get '/foo' do
    #       # process request
    #     end
    #   end
    def routing(&block)
      routing = Maf::Dsl::Routing.new
      routing.instance_exec(&block)
      routing.to_a.each do |e|
        config.register_route(e)
      end
    end
  end
end
