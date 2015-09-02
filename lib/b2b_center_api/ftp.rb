require 'net/ftp'
require 'socksify'
require 'b2b_center_api/settings'

module B2bCenterApi
  class Ftp
    class << self
      def open
        setup_socks
        Net::FTP.open(Settings.ftp_options[:host],
                      Settings.ftp_options[:user],
                      Settings.ftp_options[:password]) do |ftp|
          ftp.passive = true
          yield ftp
        end
      end

      private

      def setup_socks
        return if Settings.socks_options.blank?
        TCPSocket::socks_server = Settings.socks_options[:host] if Settings.socks_options[:host]
        TCPSocket::socks_port = Settings.socks_options[:port] if Settings.socks_options[:port]
      end
    end
  end
end
