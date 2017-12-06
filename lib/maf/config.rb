module Maf
  class Config
    # !@attribute [rw] routes
    # @returns [Maf::Routes]
    attr_accessor :routes

    def initialize
      @routes = Maf::Routes.new([])
      @html_dir = []
    end

    def register_route(route)
      @routes = @routes.add_route(route)
    end

    def register_html_dir(path)
      @html_dir << path
    end

    def resolve_html(path)
      @html_dir.each do |e|
        p = File.expand_path(path, e)
        return p if File.exist?(p)
      end
      nil
    end
  end
end
