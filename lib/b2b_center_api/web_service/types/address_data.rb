module B2bCenterApi
  module WebService
    module Types
      # Адрес
      class AddressData < WebService::BaseType
        # @return [Integer] id адреса
        #   Для добавления устанавливаем id=0
        attr_accessor :id

        # @return [Integer] id организации
        attr_accessor :firm_id

        # @return [Integer] Цифровой код страны ISO_3166-1
        attr_accessor :country

        # @return [Integer] Код региона по КЛАДРу
        #   В случае заполнения поля
        #   okato, в поле region можно передать "0", в этом
        #   случае оно заполняется автоматически по коду
        #   ОКАТО
        attr_accessor :region

        # @return [String] Код ОКАТО
        attr_accessor :okato

        # @return [String] Адрес
        attr_accessor :address

        # @return [String] Название адреса
        attr_accessor :comment

        # @return [String] Широта, в градусах
        attr_accessor :lat

        # @return [String] Долгота, в градусах
        attr_accessor :lng

        # @return [Integer] Тип задания адреса
        #   Указывается только при вызове
        #   RemoteMarket.updateAddress.
        #   Возможные значения:
        #     "0" — значения широты и долготы определятся
        #           автоматически на основании адреса;
        #     "32" — значения широты и долготы
        attr_accessor :status

        # @return [Integer] Является ли адрес неточным
        #   Возможные значения:
        #     "0" — адрес, заданный обычным способом;
        #     "1" — неточный адрес (может использоваться только в закупках по 223-ФЗ)
        attr_accessor :is_fuzzy_address

        # @return [AddressData]
        def self.from_response(response, client)
          r = response.result[:address_data]
          return if r.nil?
          ad = AddressData.new
          ad.soap_client = client
          ad.id = convert(r[:id], :integer)
          ad.firm_id = convert(r[:firm_id], :integer)
          ad.country = convert(r[:country], :integer)
          ad.region = convert(r[:region], :integer)
          ad.okato = convert(r[:okato], :string)
          ad.address = convert(r[:address], :string)
          ad.comment = convert(r[:comment], :string)
          ad.lat = convert(r[:lat], :string)
          ad.lng = convert(r[:lng], :string)
          ad.status = convert(r[:status], :integer)
          ad.is_fuzzy_address = convert(r[:is_fuzzy_address], :integer)
          ad
        end
      end
    end
  end
end
