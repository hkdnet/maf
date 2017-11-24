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

    def params
      @params ||= query_params.freeze
    end

    def content_type
      @env.fetch("CONTENT_TYPE")
    end

    private

    def query_params
      @query_params ||= query.split('&').map { |e| e.split('=', 2) }.to_h
    end
  end
end
