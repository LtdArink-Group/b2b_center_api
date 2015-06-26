module B2bCenterApi
  module WebService
    module Types
      # Предложение
      class TenderOffer < WebService::BaseType
        # @return [Integer] Номер аукциона/объявления
        attr_accessor :tender_id
        # @return [B2bCenterApi::WebService::Types::B2bFile[]] Список загруженных файлов
        attr_accessor :files
        # @return[Integer[]] Список лотов, для которых составлена конкурсная заявка
        attr_accessor :lots
        # @return[String] Файл, загруженный для переторжки
        attr_accessor :haggling_file_name
        # @return[Integer] id Фирмы
        attr_accessor :firm_id
        # @return[Integer] Номер оферты
        attr_accessor :offer_num

        # @return [TenderOffer]
        def self.from_response(response, client, tender_id, firm_id, offer_num)
          r = response.result
          return if r.nil?

          t = TenderOffer.new
          t.soap_client = client
          t.tender_id = tender_id
          t.firm_id = firm_id
          t.offer_num = offer_num
          t.files = B2bFile.from_part_response(r[:offer])
          t.lots = r[:lots].map(&:to_i) unless r[:lots].nil?
          t.haggling_file_name = convert(r[:haggling_file_name], :string)
          t
        end
      end
    end
  end
end
