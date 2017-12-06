module Maf::Dsl
  class Rendering
    def initialize(config, env)
      @config = config
      @env = env
      @status = 200
      @header = {}
      @body = []
    end

    def status(status)
      @status = status
    end

    def header(key, val)
      @header[key] = val
    end

    def html(path)
      @header['Content-Type'] = 'text/html'
      resolved = @config.resolve_html(path)
      unless resolved
        #TODO: 500
        raise 'No such page'
      end
      text = File.read(resolved)
      @body = [text]
    end

    def text(text)
      @header['Content-Type'] = 'text/plain'
      @body = [text]
    end

    def params
      @env.params
    end

    def to_a
      [ @status, @header, @body ]
    end
  end
end
