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
      @params ||= query_params.merge(body_params).freeze
    end

    # @return [String]
    def content_type
      @env.fetch("CONTENT_TYPE")
    end

    private

    def query_params
      @query_params ||= query.split('&').map { |e| e.split('=', 2) }.to_h
    end

    def body_params
      body_sio = @env['rack.input']
      return {} unless body_sio
      body = URI.decode(body_sio.read)
      case @env.fetch('CONTENT_TYPE')
      when 'application/x-www-form-urlencoded'
        # TODO: normalize foo[bar]
        body.each_line.map do |line|
          line[0..-2].split('=', 2)
        end.to_h
      else
        raise 'Unknown type'
      end
    end
  end
end
