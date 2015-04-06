require 'b2b_center_api/web_service/types/base'

module B2bCenterApi
  module WebService
    module Types
      class AuctionParticipant < Base
        attr_accessor :firm_id, :offers_nums

        def self.from_response(response, client)
          r = response.result
          mas = r[:participant].map do |p|
            ap = AuctionParticipant.new
            ap.soap_client = client
            ap.firm_id = convert(p[:firm_id], :integer)
            ap.offers_nums = convert(p[:offers_nums][:string], :integer)
            ap
          end

          mas
        end

        def firm
          remote_market.get_firm_info(firm_id)
        end
      end
    end
  end
end
