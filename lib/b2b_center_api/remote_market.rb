require 'b2b_center_api/web_service'

module B2bCenterApi
  # Методы класса RemoteMarket
  class RemoteMarket
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteMarket.new(client)
    end

    # Получить категории классификатора организации
    # @param firm_id [Integer] ID организации или 0 для своей организации
    # @param type [Integer] Тип продукции и услуг
    #   Возможные значения:
    #     '0' - Потребляемая продукция и услуги
    #     '1' - Предлагаемая продукция и услуги
    # @return [String[]]
    def get_firm_classifier(firm_id, type)
      response = @client_web.command :get_firm_classifier, firm_id: firm_id, type: type
      WebService::Types::ArrayOfIds.from_response(response)
    end

    # Получить список адресов организации
    # @param firm_id [Integer] ID организации или 0 для своей организации
    # @return [String[]]
    def get_addresses_ids(firm_id = 0)
      response = @client_web.command :get_addresses_ids, firm_id: firm_id
      WebService::Types::ArrayOfIds.from_response(response)
    end

    # Получить адрес организации по ОКАТО
    # @param okato [String] ОКАТО организации
    # @param country [Integer] Код страны. Если значение равно = 0, то используется код России = 643
    # @param address [String] Адрес (обязательно для заполнения)
    # @param firm_id [Integer] ID своей или подчиненной организации. Если = 0, то получаем идентификатор адреса своей организации
    # @return [String[]]
    def get_address_id_by_okato(okato:, address:, country: 0, firm_id: 0)
      response = @client_web.command :get_address_id_by_okato, okato: okato, address: address, country: country, firm_id: firm_id
       WebService::Types::Id.from_response(response)
    end

    # Получить адрес
    # @param address_id [Integer] ID адреса
    # @return [String[]]
    def get_address(address_id)
      response = @client_web.command :get_address, address_id: address_id
      WebService::Types::AddressData.from_response(response, @client)
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
