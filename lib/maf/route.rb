module Maf
  class Route
    attr_reader :method
    attr_reader :path

    # @param method [String] upcase HTTP method. ex: GET
    # @param path [String] path. ex: /foo
    # @param resolver [Proc] resolver which returns Array of status, headers and enumerable body
    def initialize(method, path, resolver)
      @method = method
      @path = path
      @resolver = resolver
    end

    # @param method [String] upcase HTTP method
    # @param path [String] path
    # @return [TrueClass | FalseClass] whether this route should resolve the access
    def match?(method, path)
      method == @method && path == @path
    end

    # @param env [Maf::Env]
    # @return [Array] Rack response
    def call(env)
      renderer = create_renderer(Maf.config, env)
      renderer.render(@resolver)
    end

    private

    def create_renderer(config, env)
      Maf::Renderer.new(config, env)
    end
  end
end
