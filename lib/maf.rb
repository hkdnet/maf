require "maf/version"
require 'rack'

module Maf
  class << self
    def start(app)
      Rack::Handler::WEBrick.run(app)
    end
  end

  class Server
    def call(env)
      [
        200,
        {
          'Content-Type' => 'text/plain',
        },
        [
          'A barebone app.',
        ],
      ]
    end
  end
end
