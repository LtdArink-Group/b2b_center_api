require 'b2b_center_api/web_service'

module B2bCenterApi
  # Методы класса RemoteTender
  class RemoteTender
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteTender.new(client)
    end

    # Получить данные конкурса
    # @param tender_id [Integer] Номер конкурса
    # @return [WebService::Types::TenderData]
    def get_data(tender_id)
      response = @client_web.command :get_data, tender_id: tender_id
      WebService::Types::TenderData.from_response(response, @client, tender_id)
    end

    # Получить список участников
    # @param tender_id [Integer] Номер конкурса
    # @return [WebService::Types::TenderParticipant[]]
    def get_participants(tender_id)
      response = @client_web.command :get_participants, tender_id: tender_id
      WebService::Types::TenderParticipant.from_response(response, @client, tender_id)
    end

    # Получить конкурсную заявку участника
    # @param tender_id [Integer] Номер конкурса
    # @param firm_id [Integer] ID организации (участник торговой процедуры)
    # @param offer_num [Integer] = 0 — основное предложение = целое_число — альтернативное предложение №
    # @return [WebService::Types::TenderOffer]
    def get_offer(tender_id, firm_id, offer_num)
      response = @client_web.command :get_offer, tender_id: tender_id, firm_id: firm_id, offer_num: offer_num
      WebService::Types::TenderOffer.from_response(response, @client, tender_id, firm_id, offer_num)
    end

    # Получить результаты обработки лота
    # @param tender_id [Integer] Номер конкурса
    # @param lot_id [Integer] Номер лота
    # @return [WebService::Types::TenderLotResults]
    def get_lot_result(tender_id, lot_id)
      response = @client_web.command :get_lot_result, tender_id: tender_id, lot_id: lot_id
      WebService::Types::TenderLotResults.from_response(response, @client, tender_id, lot_id)
    end
  end
end
