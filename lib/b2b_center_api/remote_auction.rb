require 'b2b_center_api/web_service'

module B2bCenterApi
  class RemoteAuction
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteAuction.new(client)
    end

    def get_participants(auction_id)
      response = @client_web.command :get_participants, auction_id: auction_id
      WebService::Types::AuctionParticipant.from_response(response, @client)
    end
  end
end
