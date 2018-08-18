
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_template_debugger/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_template_debugger"
  spec.version       = RailsTemplateDebugger::VERSION
  spec.authors       = ["Peter Schilling"]
  spec.email         = ["peter@peterschilling.org"]

  spec.summary       = %q{Debug rails html templates}

  spec.description   = <<~MSG
    Wraps rendered templates with html comments showing the template path. Also
    throws in some meta tags which are easier to copy/paste in devtools.
  MSG

  spec.homepage      = "https://github.com/schpet/rails_template_debugger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
