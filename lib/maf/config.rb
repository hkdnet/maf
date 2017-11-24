module Maf
  class Config
    attr_accessor :routes

    def initialize
      @routes = Maf::Routes.new([])
    end

    def regsiter_routes(route)
      @routes = @routes.add_route(route)
    end
  end
end
