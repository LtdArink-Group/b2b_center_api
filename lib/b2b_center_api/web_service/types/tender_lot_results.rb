module B2bCenterApi
  module WebService
    module Types
      # список результатов обработки предложений
      class TenderLotResults < WebService::BaseType
        # @return [Integer] Номер конкурса
        attr_accessor :tender_id
        # @return [Integer] Номер лота
        attr_accessor :lot_id

        # @return [B2bCenterApi::WebService::Types::TenderLotResult[]]
        # Список результатов обработки конкурсных заявок (массив структур tender_lot_result).
        attr_accessor :results
        # @return [String] Статус завершения торгов по данному лоту. Возможные значения:
        # "" — организатор не вынес никакого решения
        # "rank" — организатор завершил процедуру, проранжировав заявки и выбрав победителя
        # "none" — организатор не определил победителя
        # "sole" — закупка у единственного источника
        # "fail" — организатор признал конкурс несостоявшимся
        # "cancel" — организатор принял решение отказаться от проведения конкурса
        attr_accessor :result_status
        # @return [String] Причина отклонения всех заявок (если result_status == "cancel")
        attr_accessor :reason

        # @return [TenderLotResults]
        def self.from_response(response, client, tender_id, lot_id)
          r = response.result
          return if r.nil?

          t = TenderLotResults.new
          t.soap_client = client
          t.tender_id = tender_id
          t.lot_id = lot_id

          t.results = TenderLotResult.from_part_response(r[:results])
          t.result_status = convert(r[:result_status], :string)
          t.reason = convert(r[:reason], :string)
          t
        end
      end
    end
  end
end
