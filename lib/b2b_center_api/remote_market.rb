require 'b2b_center_api/web_service'

module B2bCenterApi
  # Методы класса RemoteMarket
  class RemoteMarket
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteMarket.new(client)
    end

    # Получить информацию об организации
    # @param firm_id [Integer] ID организации
    # @return [WebService::Types::FirmInfo]
    def get_firm_info(firm_id)
      response = @client_web.command :get_firm_info, firm_id: firm_id
      WebService::Types::FirmInfo.from_response(response, @client, firm_id)
    end
  end
end