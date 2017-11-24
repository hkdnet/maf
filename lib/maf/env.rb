module Maf
  class Env
    def initialize(env)
      @env = env
    end

    def method
      @env.fetch('REQUEST_METHOD')
    end

    def path
      @env.fetch('REQUEST_PATH')
    end

    def query
      @env.fetch('QUERY_STRING')
    end
  end
end
