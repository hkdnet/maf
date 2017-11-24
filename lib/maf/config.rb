module Maf
  class Config
    attr_accessor :routes

    def initialize
      @routes = Maf::Routes.new([])
    end

    def register_route(route)
      @routes = @routes.add_route(route)
    end
  end
end
