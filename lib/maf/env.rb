module Maf
  class Env
    # @param env [Hash{String => String}] Rack env
    def initialize(env)
      @env = env
    end

    # @return [String]
    def method
      @env.fetch('REQUEST_METHOD')
    end

    # @return [String]
    def path
      @env.fetch('REQUEST_PATH')
    end

    # @return [String]
    def query
      @env.fetch('QUERY_STRING')
    end

    # @return [Hash{String => String}] query_params
    # @note frozen
    def params
      @params ||= query_params.freeze
    end

    # @return [String]
    def content_type
      @env.fetch("CONTENT_TYPE")
    end

    private

    def query_params
      @query_params ||= query.split('&').map { |e| e.split('=', 2) }.to_h
    end
  end
end
