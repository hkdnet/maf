module Maf
  class Config
    attr_accessor :routes

    def initialize
      @routes = []
    end

    def regsiter_routes(route)
      routes << route
    end
  end
end
