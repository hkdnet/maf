require 'rack'

module Maf
  class Env
    # @param env [Rack::Request]
    def initialize(req)
      @req = req
    end

    # @return [String]
    def method
      @req.request_method
    end

    # @return [String]
    def path
      @req.path
    end

    # @return [Hash{String => String}] query_params
    # @note frozen
    def params
      @params ||= @req.params.dup.freeze
    end

    # @return [String]
    def content_type
      @req.content_type
    end
  end
end
