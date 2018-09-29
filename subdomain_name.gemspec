lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'subdomain_name/version'

Gem::Specification.new do |s|
  s.name          = 'subdomain_name'
  s.version       = SubdomainName::VERSION
  s.authors       = ['Dominic Sayers']
  s.email         = ['dominic@sayers.cc']
  s.summary       = 'Manage subdomain names'
  s.homepage      = 'https://github.com/dominicsayers/subdomain_name'
  s.license       = 'MIT'

  s.files = `git ls-files lib LICENSE`.split($RS)
  s.require_paths = ['lib']
end
