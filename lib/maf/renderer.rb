module Maf
  class Renderer
    # @params env [Maf::Env]
    def initialize(config, env)
      @config = config
      @env = env
    end

    # @params block [Proc] resolver
    def render(block)
      rendering = Maf::Dsl::Rendering.new(@config, @env)
      rendering.instance_exec(&block)
      rendering.to_a
    end
  end
end
