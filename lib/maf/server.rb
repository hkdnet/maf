module Maf
  class Server
    def initialize(config = Maf.config)
      @config = config
    end

    def call(env)
      myenv = Maf::Env.new(env)
      route = @config.routes.find(myenv.method, myenv.path)
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
