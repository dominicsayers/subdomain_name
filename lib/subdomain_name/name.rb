require 'idn'
require 'reserved_subdomain'

module SubdomainName
  class Name
    include IDN

    ACE_PREFIX = Idna::ACE_PREFIX

    def initialize(name)
      @name = name
    end

    def valid?
      Idna.toASCII @name, IDN::Idna::USE_STD3_ASCII_RULES
      true
    rescue IDN::Idna::IdnaError
      false
    end

    def reserved?
      @reserved ||= ReservedSubdomain.new(@name).reserved?
    end

    def idn?
      @idn ||= [to_ascii, to_unicode].any? { |value| value != @name }
    end

    def to_ascii
      @to_ascii ||= Idna.toASCII @name
    end

    def to_unicode
      @to_unicode ||= Idna.toUnicode @name
    end
  end
end
