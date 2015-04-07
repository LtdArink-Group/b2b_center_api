require 'b2b_center_api/settings'
require 'b2b_center_api/remote_auction'
require 'b2b_center_api/remote_market'
require 'b2b_center_api/remote_tender'
require 'savon'

module B2bCenterApi
  # Client for API
  class Client
    # Методы класса RemoteAuction
    # @return [RemoteAuction]
    attr_accessor :remote_auction
    # Методы класса RemoteMarket
    # @return [RemoteMarket]
    attr_accessor :remote_market
    # Методы класса RemoteTender
    # @return [RemoteTender]
    attr_accessor :remote_tender

    def initialize
      @client = Savon.client(Settings.soap_options)
      @remote_auction = RemoteAuction.new(@client)
      @remote_market = RemoteMarket.new(@client)
      @remote_tender = RemoteTender.new(@client)
    end
  end
end
