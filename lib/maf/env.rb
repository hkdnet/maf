module Maf
  class Env
    def initialize(env)
      @env = env
    end

    def method
      @env['REQUEST_METHOD']
    end

    def path
      @env['REQUEST_PATH']
    end

    def query
      @env['QUERY_STRING']
    end
  end
end
