module DiagPages
  class Configuration

    attr_accessor :diag_tests
    attr_accessor :external_links
    attr_accessor :combined_tests
    attr_reader :default_tests

    def initialize
      @diag_tests = []
      @default_tests = [
        # {
        #   name: "nslookup",
        #   link: "nslookup",
        #   description: "It will lookup the IP Address",
        #   status: nil,
        #   block: lambda {
        #     begin
        #       @dnsr = Resolv::DNS.new(nameserver: ['8.8.8.8', '8.8.8.4'])
        #       return @dnsr.getaddress "pennymacusa.com"
        #     rescue Resolv::ResolvError => e
        #       return "fail"
        #     end
        #   }
        # }
      ]

      @external_links = []

      @combined_tests = []
    end
  end
end
