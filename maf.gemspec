
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "maf/version"

Gem::Specification.new do |spec|
  spec.name          = "maf"
  spec.version       = Maf::VERSION
  spec.authors       = ["hkdnet"]
  spec.email         = ["satoko.itse@gmail.com"]

  spec.summary       = 'My appliation framework'
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/hkdnet/maf"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
