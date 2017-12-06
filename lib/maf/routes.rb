module Maf
  class Routes
    # @param routes [Array{Maf::Route}]
    def initialize(routes)
      @routes = routes.freeze
    end

    def add_route(route)
      routes = @routes.dup
      routes << route
      Maf::Routes.new(routes)
    end

    # @param method [String] HTTP method
    # @param path [String] path
    # @return [Maf::Route] which should respond to this request
    def find(method, path)
      @routes.find { |e| e.match?(method, path) }
    end
  end
end
