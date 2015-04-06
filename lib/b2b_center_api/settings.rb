module B2bCenterApi
  # A 'global' config.
  class Settings
    @soap_options = {}
    @auth_options = {}

    # Configure through hash
    def self.soap_configure(opts = {})
      opts.each { |k, v| @soap_options[k.to_sym] = v }
    end

    def self.auth_configure(opts = {})
      opts.each { |k, v| @auth_options[k.to_sym] = v }
    end

    class << self
      attr_reader :soap_options, :auth_options
    end
  end
end
