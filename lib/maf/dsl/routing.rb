module Maf::Dsl
  class Routing
    def initialize
      @routes = []
    end

    def get(path, &block)
      routes << Maf::Route.new('GET', path, block)
    end

    def to_a
      routes
    end

    private

    attr_reader :routes
  end
end
