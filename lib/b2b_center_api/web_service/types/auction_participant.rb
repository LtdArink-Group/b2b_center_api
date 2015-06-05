module B2bCenterApi
  module WebService
    module Types
      # Участник аукциона
      class AuctionParticipant < WebService::BaseType
        # @return [Integer] Номер аукциона/объявления
        attr_accessor :auction_id
        # @return [String] ID организации участника, если имена участников доступны,
        #   либо строка вида "Participant N", где N — номер участника в списке участников, в противном случае.
        attr_accessor :firm_id
        # @return [Integer[]] Список отправленных заявок участником.
        #   Возможные значения:
        #   0 — основное предложение
        #   целое_число — альтернативное предложение №
        attr_accessor :offers_nums

        # @return [Array] Массив {AuctionParticipant}
        def self.from_response(response, client, auction_id)
          r = response.result[:participants]
          return if r.nil?
          mas = to_array(r[:participant]).map do |p|
            ap = AuctionParticipant.new
            ap.soap_client = client
            ap.auction_id = auction_id
            ap.firm_id = convert(p[:firm_id], :string)
            ap.offers_nums = ArrayOfIds.from_part_response(p[:offers_nums]).map(&:to_i)
            ap
          end

          mas
        end

        # @return [FirmInfo] Информация об организации
        def firm
          return firm_id if firm_id.include? 'Participant'
          remote_market.get_firm_info(firm_id)
        end

        # @return [AuctionOffer[]] Массив предложений
        def offers
          offers_nums.map { |offer_num| remote_auction.get_offer(auction_id, firm_id, offer_num) }
        end
      end
    end
  end
end
