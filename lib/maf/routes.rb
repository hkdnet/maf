module Maf
  class Routes
    attr_reader :routes

    def initialize(routes)
      @routes = routes
    end

    def add_route(route)
      routes = @routes.dup
      routes << route
      Maf::Routes.new(routes)
    end

    def find(method, path)
      routes.find { |e| e.match?(method, path) }
    end
  end
end
