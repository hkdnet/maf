module Maf
  class Route
    attr_reader :method
    attr_reader :path

    def initialize(method, path, resolver)
      @method = method
      @path = path
      @resolver = resolver
    end

    def match?(method, path)
      method == @method && path == @path
    end

    def call(env)
      Maf::Renderer.new(env).render(@resolver)
    end
  end
end
