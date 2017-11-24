module Maf
  class Renderer
    def initialize(env)
      @env = env
    end

    def render(block)
      rendering = Maf::Dsl::Rendering.new(@env)
      rendering.instance_exec(&block)
      rendering.to_a
    end
  end
end
