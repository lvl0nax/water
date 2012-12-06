# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tinymce-rails-imageupload"
  s.version = "3.5.6.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Per Christian B. Viken"]
  s.date = "2012-08-27"
  s.description = "TinyMCE plugin for taking image uploads in Rails >= 3.1"
  s.email = ["perchr@northblue.org"]
  s.homepage = "http://eastblue.org/oss"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.22"
  s.summary = "TinyMCE plugin for taking image uploads in Rails >= 3.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
      s.add_runtime_dependency(%q<tinymce-rails>, [">= 3.4.9"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1"])
      s.add_dependency(%q<tinymce-rails>, [">= 3.4.9"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1"])
    s.add_dependency(%q<tinymce-rails>, [">= 3.4.9"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end
