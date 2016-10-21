require "diag_pages/engine"
require "diag_pages/configuration"

module DiagPages

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)

    configuration.combined_tests = configuration.diag_tests + configuration.default_tests
  end

end
