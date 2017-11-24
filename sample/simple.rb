require 'maf'

Maf.routing do
  get '/foo' do
    text "matched /foo\n"
  end

  post '/bar' do
    text "matched /bar\n"
  end
end

app = Maf::Server.new
Maf.start(app)
