module Maf
  # A Rack application
  class Server
    # @param config [Maf::Config]
    def initialize(config = Maf.config)
      @config = config
    end

    # @param env [Hash{String => String}] rack env
    # @return [Array] of status, headers, body
    def call(env)
      myenv = Maf::Env.new(Rack::Request.new(env))
      route = @config.routes.find(myenv.method, myenv.path)
      return render_400 unless route

      route.call(myenv)
    end

    private


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
