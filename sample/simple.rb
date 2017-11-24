require 'maf'

Maf.routing do
  get '/foo' do
    text "matched /foo\n"
  end
end

app = Maf::Server.new
Maf.start(app)
