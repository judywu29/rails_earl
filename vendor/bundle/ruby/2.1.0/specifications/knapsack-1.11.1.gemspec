# -*- encoding: utf-8 -*-
# stub: knapsack 1.11.1 ruby lib

Gem::Specification.new do |s|
  s.name = "knapsack"
  s.version = "1.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["ArturT"]
  s.date = "2016-06-03"
  s.description = "Parallel tests across CI server nodes based on each test file's time execution. It generates a test time execution report and uses it for future test runs."
  s.email = ["arturtrzop@gmail.com"]
  s.executables = ["knapsack", "print_header.sh"]
  s.files = ["bin/knapsack", "bin/print_header.sh"]
  s.homepage = "https://github.com/ArturT/knapsack"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Knapsack splits tests across CI nodes and makes sure that tests will run comparable time on each node."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<timecop>, [">= 0.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0", "~> 3.0"])
      s.add_development_dependency(%q<rspec-its>, ["~> 1.2"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<spinach>, [">= 0.8"])
      s.add_development_dependency(%q<minitest>, [">= 5.0.0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, ["~> 0"])
      s.add_development_dependency(%q<pry>, ["~> 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rspec>, [">= 2.0.0", "~> 3.0"])
      s.add_dependency(%q<rspec-its>, ["~> 1.2"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<spinach>, [">= 0.8"])
      s.add_dependency(%q<minitest>, [">= 5.0.0"])
      s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0"])
      s.add_dependency(%q<pry>, ["~> 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rspec>, [">= 2.0.0", "~> 3.0"])
    s.add_dependency(%q<rspec-its>, ["~> 1.2"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<spinach>, [">= 0.8"])
    s.add_dependency(%q<minitest>, [">= 5.0.0"])
    s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0"])
    s.add_dependency(%q<pry>, ["~> 0"])
  end
end
