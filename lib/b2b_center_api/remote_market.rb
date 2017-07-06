require 'b2b_center_api/web_service'

module B2bCenterApi
  # Методы класса RemoteMarket
  class RemoteMarket
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteMarket.new(client)
    end

    # Получить список адресов организации
    # @param firm_id [Integer] ID организации или 0 для своей организации
    # @return [String[]]
    def get_addresses_ids(firm_id = 0)
      response = @client_web.command :get_addresses_ids, firm_id: firm_id
      response.result[:ids]
    end

    # Получить информацию об организации
    # @param firm_id [Integer] ID организации
    # @return [WebService::Types::FirmInfo]
    def get_firm_info(firm_id)
      response = @client_web.command :get_firm_info, firm_id: firm_id
      WebService::Types::FirmInfo.from_response(response, @client, firm_id)
    end

    # Получить информацию об организации по инн
    # @param inn [String] ИНН организации
    # @return [WebService::Types::FirmData]
    def find_firm_by_inn(inn)
      response = @client_web.command :find_firm, firm_request: { inn: inn }
      WebService::Types::FirmData.from_response(response, @client)
    end
  end
end
