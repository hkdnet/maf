module Maf::Dsl
  class Rendering
    def initialize(env)
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
