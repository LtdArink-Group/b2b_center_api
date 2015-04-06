require 'b2b_center_api/settings'
require 'b2b_center_api/remote_auction'
require 'b2b_center_api/remote_market'
require 'b2b_center_api/remote_tender'
require 'savon'

module B2bCenterApi
  # Soap Client
  class Client
    attr_accessor :remote_auction,
                  :remote_market,
                  :remote_tender

    def initialize(options = nil)
      options ||= Settings.soap_options
      @client = Savon.client(options)
      @remote_auction = RemoteAuction.new(@client)
      @remote_market = RemoteMarket.new(@client)
      @remote_tender = RemoteTender.new(@client)
    end
  end
end
