Gem::Specification.new do |s|
  s.name = %q{toto}
  s.version = "0.4.9"

  s.authors = ["cloudhead"]
  s.date = %q{2010-12-01}
  s.description = %q{the tiniest blog-engine in Oz.}
  s.email = %q{self@cloudhead.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files         = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/cloudhead/toto}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{the tiniest blog-engine in Oz}
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_development_dependency "riot", ">= 0"
  s.add_development_dependency "rake", ">= 0"
  s.add_development_dependency "hpricot", ">= 0"
  
  s.add_runtime_dependency "builder", ">= 0"
  s.add_runtime_dependency "rack", ">= 0"
  s.add_runtime_dependency "redcarpet", "1.17.2"
  s.add_runtime_dependency "coderay", "1.0.9"

end

