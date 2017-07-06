require 'b2b_center_api/web_service'

module B2bCenterApi
  # Методы класса RemoteAuction
  class RemoteAuction
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteAuction.new(client)
    end

    # Создать новый аукцион
    # @param auction_data [WebService::Types::AuctionData, Hash] Данные для создания аукциона
    # @return [Integer] id созданной процедуры
    def create(auction_data)
      auction_data = auction_data.to_h unless auction_data.is_a? Hash
      response = @client_web.command :create, data: auction_data
      response.result[:value]
    end

    # Получить данные аукциона
    # @param auction_id [Integer] Номер процедуры
    # @return [WebService::Types::AuctionData]
    def get_data(auction_id)
      response = @client_web.command :get_data, auction_id: auction_id
      WebService::Types::AuctionData.from_response(response, @client, auction_id)
    end

    # Получить список участников
    # @param auction_id [Integer] Номер аукциона/объявления
    # @return [WebService::Types::AuctionParticipant[]]
    def get_participants(auction_id)
      response = @client_web.command :get_participants, auction_id: auction_id
      WebService::Types::AuctionParticipant.from_response(response, @client, auction_id)
    end

    # Получить список идентификаторов лотов многолотовой процедуры
    # @param auction_id [Integer] Номер аукциона/объявления
    # @return [WebService::Types::ArrayOfIds[]]
    def get_group_ids(auction_id)
      response = @client_web.command :get_group_ids, auction_id: auction_id
      WebService::Types::ArrayOfIds.from_response(response)
    end

    # Получить предложение участника
    # Метод возвращает информацию о предложении (альтернативном предложении) участника:
    # последней ставке, имя файла с описанием предложения, информацию о том признан ли участник победителем.
    # Возвращаемый методом файл доступен для скачивания из корневой FTP-папки организации.
    # @param auction_id [Integer] Номер аукциона/объявления
    # @param firm_id [Integer] ID организации (участник торговой процедуры)
    # @param offer_num [Integer] = 0 — основное предложение = целое_число — альтернативное предложение №
    # @return [WebService::Types::AuctionOffer]
    def get_offer(auction_id, firm_id, offer_num)
      response = @client_web.command :get_offer, auction_id: auction_id, firm_id: firm_id, offer_num: offer_num
      WebService::Types::AuctionOffer.from_response(response, @client, auction_id, firm_id, offer_num)
    end
  end
end
