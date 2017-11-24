require 'rack'
require "maf/version"

require "maf/server"
require "maf/config"
require "maf/route"
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

    def routing(&block)
      routing = Maf::Dsl::Routing.new
      routing.instance_exec(&block)
      config.routes += routing.to_a
    end
  end
end
