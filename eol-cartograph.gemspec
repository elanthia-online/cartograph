require_relative 'lib/eol-cartograph/version'

Gem::Specification.new do |spec|
  spec.name          = "eol-cartograph"
  spec.version       = Cartograph::VERSION
  spec.authors       = ["Ondreian Shamsiel"]
  spec.email         = "ondreian.shamsiel@gmail.com"
  spec.summary       = %q{map definition and graph traversal for Elanthia}
  spec.homepage      = "https://github.com/elanthia-online/cartograph"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/elanthia-online/cartograph"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = (Dir.chdir(File.expand_path('..', __FILE__)) do
    ["dist/gsiv.json"] + `git ls-files -z`.split("\x0")
      .reject { |f| 
        f.match(%r{^(bin|test|spec|util|features|shims|tasks)/}) or 
        f.match(%r{^maps/gsiv/rooms}) or
        f.match(%r{/checksum$})
      }
  end)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "dist"]
end
