require 'semver'

module Toto
  class Version
    v = SemVer.find
    MAJOR = v.major
    MINOR = v.minor
    PATCH = v.patch
    PRE = nil

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end