require 'maf'
require 'json'

Maf.routing do
  get '/foo' do
    text <<~EOS
    matched /foo
    #{params.to_json}
    EOS
  end

  post '/bar' do
    text "matched /bar\n"
  end
end

app = Maf::Server.new
Maf.start(app)
