module B2bCenterApi
  module WebService
    module Types
      # результаты обработки конкурсных заявок
      class TenderLotResult < WebService::BaseType
        # @return[Integer] ID организации
        attr_accessor :firm_id
        # @return[Integer] Номер альтернативного предложения.
        # = 0 — для основной конкурсной заявки
        attr_accessor :alternate_num
        # @return[String] Конкурсная заявка по лоту:
        # "" — не обработана
        # "none" — не поступила
        # "received" — поступила
        # "reject" — отклонена. Формат значения VARCHAR(10)
        attr_accessor :result
        # @return[String] Причина отклонения заявки по лоту
        attr_accessor :reason
        # @return[Integer] Номер, полученный при ранжировке
        attr_accessor :rank
        # @return[Float] Цена с НДС. Формат значения DECIMAL(15,2)
        attr_accessor :price
        # @return[Float] Цена без НДС. Формат значения DECIMAL(15,2)
        attr_accessor :price_notax
        # @return[String] Предмет конкурсной заявки
        attr_accessor :subject
        # @return[String] Существенные условия конкурсной заявки
        attr_accessor :essential
        # @return[Float] Цена после переторжки с НДС. Формат значения DECIMAL(15,2)
        attr_accessor :haggling_price
        # @return[Float] Цена после переторжки без НДС. Формат значения DECIMAL(15,2)
        attr_accessor :haggling_price_notax
        # @return[Float] Итоговая цена с НДС. Формат значения DECIMAL(15,2)
        attr_accessor :final_price
        # @return[Float] Итоговая цена без НДС. Формат значения DECIMAL(15,2)
        attr_accessor :final_price_notax

        # @return [TenderLotResult[]]
        def self.from_part_response(response)
          return if response.nil?
          results = to_array(response[:tender_lot_result]).map do |tlr|
            t = TenderLotResult.new
            t.firm_id = convert(tlr[:firm_id], :integer)
            t.alternate_num = convert(tlr[:alternate_num], :integer)
            t.result = convert(tlr[:result], :string)
            t.reason = convert(tlr[:reason], :string)
            t.rank = convert(tlr[:rank], :integer)
            t.price = convert(tlr[:price], :float)
            t.price_notax = convert(tlr[:price_notax], :float)
            t.subject = convert(tlr[:subject], :string)
            t.essential = convert(tlr[:essential], :string)
            t.haggling_price = convert(tlr[:haggling_price], :float)
            t.haggling_price_notax = convert(tlr[:haggling_price_notax], :float)
            t.final_price = convert(tlr[:final_price], :float)
            t.final_price_notax = convert(tlr[:final_price_notax], :float)
            t
          end
          results
        end
      end
    end
  end
end
