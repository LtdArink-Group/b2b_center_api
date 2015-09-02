module B2bCenterApi
  # A 'global' config.
  class Settings
    @soap_options = {}
    @auth_options = {}
    @ftp_options = {}
    @socks_options = {}

    # Configure through hash
    def self.soap_configure(opts = {})
      opts.each { |k, v| @soap_options[k.to_sym] = v }
    end

    def self.auth_configure(opts = {})
      opts.each { |k, v| @auth_options[k.to_sym] = v }
    end

    def self.ftp_configure(opts = {})
      opts.each { |k, v| @ftp_options[k.to_sym] = v }
    end

    def self.socks_configure(opts = {})
      opts.each { |k, v| @socks_options[k.to_sym] = v }
    end

    class << self
      attr_reader :soap_options, :auth_options, :ftp_options, :socks_options
    end
  end
end
