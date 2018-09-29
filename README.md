# SubdomainName
[![Gem Version](https://badge.fury.io/rb/subdomain_name.svg)](https://rubygems.org/gems/subdomain_name)
[![Gem downloads](https://img.shields.io/gem/dt/subdomain_name.svg)](https://rubygems.org/gems/subdomain_name)
[![Build Status](https://travis-ci.org/dominicsayers/subdomain_name.svg?branch=master)](https://travis-ci.org/dominicsayers/subdomain_name)
[![Maintainability](https://api.codeclimate.com/v1/badges/53c0395f76bc52f53b60/maintainability)](https://codeclimate.com/github/dominicsayers/subdomain_name/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/53c0395f76bc52f53b60/test_coverage)](https://codeclimate.com/github/dominicsayers/subdomain_name/test_coverage)
[![Dependency Status](https://dependencyci.com/github/dominicsayers/subdomain_name/badge)](https://dependencyci.com/github/dominicsayers/subdomain_name)
[![security](https://hakiri.io/github/dominicsayers/subdomain_name/master.svg)](https://hakiri.io/github/dominicsayers/subdomain_name/master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/29f585281caf46eb9e30972b413d0003)](https://www.codacy.com/app/dominicsayers/subdomain_name)

SubdomainName is a Ruby gem that helps validate subdomain names that you might use in your app, for instance to allocate to users' accounts.

## Usage

```ruby
SubdomainName['foobar'].valid? # => true
SubdomainName['foobar'].reserved? # => false

SubdomainName['-foobar-'].valid? # => false

SubdomainName['www'].valid? # => true
SubdomainName['www'].reserved? # => true

SubdomainName['räksmörgås'].valid? # => true
SubdomainName['räksmörgås'].idn? # => true

SubdomainName['räksmörgås'].to_ascii # => xn--rksmrgs-5wao1o
SubdomainName['xn--rksmrgs-5wao1o'].to_unicode # => räksmörgås
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'subdomain_name'
```

## Reserved subdomains

If you issue subdomains for an app there are some that ought to be reserved (i.e. not issued to a user), like `mail` and `www`. The `reserved?` method tells you whether a subdomain name should be reserved. Whether a subdomain is reserved or not is determined by the [ReservedSubdomain gem](https://rubygems.org/gems/reserved_subdomain).

## Contributing

1.  Fork the repo into your own account.
1.  Copy the `Gemfile.local.example` to `Gemfile.local` and edit as you see fit.
1.  Organize your changes into easy-to-understand commits.
2.  Submit a pull request for me to merge.
