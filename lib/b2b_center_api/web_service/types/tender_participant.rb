module B2bCenterApi
  module WebService
    module Types
      # Участник конкурса
      class TenderParticipant < WebService::BaseType
        # @return [Integer] Номер конкурса
        attr_accessor :tender_id
        # @return [String] ID организации участника, если имена участников доступны,
        #   либо строка вида "Participant N", где N — номер участника в списке участников, в противном случае.
        attr_accessor :firm_id
        # @return [Integer] Статус участника:
        # = 0 — отказался от участия,
        # = 1 — участвует в конкурсе
        attr_accessor :status
        # @return [Time] С этой даты организация участвует в конкурсе. Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_sent
        # @return [Time] Дата отправки предквалификационной заявки. Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_qoffer
        # @return [Time] Дата отправки конкурсной заявки. Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_offer
        # @return [Integer] Прошла ли организация предквалификационный отбор:
        # 0 — нет,
        # 1 — да
        attr_accessor :qualified
        # @return [Time] Дата, когда организация прошла предквалификационный отбор. Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_qualified
        # @return [Integer[]] Список отправленных заявок участником.
        #   Возможные значения:
        #   -1 — предквалификационная заявка
        #   0 — конкурсная заявка
        #   целое_число — альтернативное предложение №
        attr_accessor :offers_nums

        # @return [Array] Массив {TenderParticipant}
        def self.from_response(response, client, tender_id)
          r = response.result[:value]
          return if r.nil?
          mas = to_array(r[:participant]).map do |p|
            ap = TenderParticipant.new
            ap.soap_client = client
            ap.tender_id = tender_id
            ap.firm_id = convert(p[:firm_id], :string)
            ap.status = convert(p[:status], :integer)
            ap.date_sent = convert(p[:date_sent], :time)
            ap.date_qoffer = convert(p[:date_qoffer], :time)
            ap.date_offer = convert(p[:date_offer], :time)
            ap.qualified = convert(p[:qualified], :integer)
            ap.date_qualified = convert(p[:date_qualified], :time)
            ap.offers_nums = ArrayOfIds.from_part_response(p[:offers_nums]).flatten.map(&:to_i)
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
          offers_nums.map { |offer_num| remote_tender.get_offer(tender_id, firm_id, offer_num) }
        end
      end
    end
  end
end
