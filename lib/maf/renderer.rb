module Maf
  class Renderer
    # @params env [Maf::Env]
    def initialize(env)
      @env = env
    end

    # @params block [Proc] resolver
    def render(block)
      rendering = Maf::Dsl::Rendering.new(@env)
      rendering.instance_exec(&block)
      rendering.to_a
    end
  end
end
