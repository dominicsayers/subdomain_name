require 'subdomain_name/name'

module SubdomainName
  module_function

  def [](name)
    Name.new(name)
  end
end
