# frozen_string_literal: true

require_relative "lib/yaks/interactor/version"

Gem::Specification.new do |spec|
  spec.name = "yaks-interactor"
  spec.version = Yaks::Interactor::VERSION
  spec.authors = ["Eugene Yak"]
  spec.email = ["eugeneyak@gmail.com"]

  spec.summary = "Lightweight interactor pattern implementation with middleware support"
  spec.description = "A Ruby gem providing a simple interactor pattern with middleware chain support and fiber-local execution stack"
  spec.homepage = "https://github.com/eugeneyak/interactor"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/eugeneyak/interactor"
  spec.metadata["changelog_uri"] = "https://github.com/eugeneyak/interactor/blob/main/CHANGELOG.md"

  # Список файлов гема
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Зависимости для разработки
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
end