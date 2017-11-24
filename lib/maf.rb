require 'rack'
require "maf/version"

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

    def routing
      routing = Maf::Dsl::Routing.new
      yield routing
      config.routes += routing.to_a
    end
  end

  class Server
    def initialize(config = Maf.config)
      @config = config
    end

    def call(env)
      myenv = Maf::Env.new(env)
      route = @config.routes.find { |e| e.match?(myenv.method, myenv.path) }
      return render_400 unless route

      route.call(myenv)
    end

    def render_400
      [
        400,
        {
          'Content-Type' => 'text/plain',
        },
        [
          "No route matches\n",
        ],
      ]
    end
  end
end
