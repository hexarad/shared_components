require_relative "lib/hexarad_shared_components/version"

Gem::Specification.new do |spec|
  spec.name        = "hexarad_shared_components"
  spec.version     = HexaradSharedComponents::VERSION
  spec.authors     = [ "Hexarad" ]
  spec.email       = [ "dev@hexarad.com" ]
  spec.homepage    = "https://github.com/hexarad/hexarad_shared_components"
  spec.summary     = "Shared UI components for Hexarad applications"
  spec.description = "A collection of reusable UI components for Hexarad Rails applications"
  spec.license     = "MIT"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0"
end
