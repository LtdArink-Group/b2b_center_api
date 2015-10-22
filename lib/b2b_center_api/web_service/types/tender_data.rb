module B2bCenterApi
  module WebService
    module Types
      # Конкурс
      class TenderData < WebService::BaseType
        # @return [Integer] id конкурса
        # При создании нового конкурса это поле можно опустить, либо =0
        attr_accessor :id
        # @return [Integer] Тип конкурса
        #   Возможные значения
        #     0 — закрытый конкурс
        #     1 — открытый конкурс
        #     2 — закрытые конкурентные переговоры
        #     3 — открытые конкурентные переговоры
        attr_accessor :open
        # @return [String] Предмет конкурса
        attr_accessor :common_name
        # @return[B2bCenterApi::WebService::Types::Lot[]] Лоты
        attr_accessor :lots
        # @return[String] Дата начала поставки товаров, проведения работ, оказания услуг.
        # Формат значения dd.mm.YYYY
        attr_accessor :date_job_begin
        # @return[String] Дата окончания поставки товаров, проведения работ, оказания услуг.
        # Формат значения dd.mm.YYYY
        attr_accessor :date_job_end
        # @return[String] Дата вскрытия конвертов. Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_unsealing
        # @return [Integer] Часовой пояс
        #   Возможные значения
        #     0 — "Время московское"
        #     1 — "Время московское +1 час"
        #     и т.д.
        attr_accessor :date_unsealing_comment
        # @return[String] Информация о конкурсной комиссии
        attr_accessor :committee
        # @return[String] Требования к участникам конкурса
        attr_accessor :participants
        # @return[String] Крайний срок подачи предквалификационных документов.
        # Если поле отсутствует, либо = “”, то конкурс проводится без предквалификационного отбора.
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_qualification
        # @return[String] Квалификационные требования к участнику
        attr_accessor :qualification_documents
        # @return[String] Комплект конкурсной документации
        attr_accessor :tender_documents
        # @return[String] Обеспечение конкурсных заявок, кроме банковских гарантий
        attr_accessor :applications_deposit
        # @return[String] Конкурсные заявки — требования к оформлению
        attr_accessor :competitive_offers
        # @return[String] Вскрытие конвертов с конкурсными заявками
        attr_accessor :unsealing
        # @return[Integer] Ценовой конкурс
        #   Возможные значения
        #     1 — ценовой конкурс
        #     0 — нет
        attr_accessor :price_only
        # @return[String] Победитель конкурса
        attr_accessor :winner
        # @return[String] Начальная (лимитная) цена
        attr_accessor :initial_price
        # @return[Integer] Валюта:
        #   Возможные значения
        #     0 — руб,
        #     1 — USD,
        #     2 — EUR,
        #     4 — UAH
        attr_accessor :protocol_currency
        # @return[String] Дополнительная информация о конкурсе
        attr_accessor :additional_information
        # @return[Integer] Флаг проведения переторжки:
        #   Возможные значения
        #     0 — без переторжки
        #     1 —с переторжкой
        attr_accessor :haggling
        # @return[Integer] Подразделение
        #   Значение по умолчанию
        #     0 — «вне подразделений»
        attr_accessor :sel_dep_id
        # @return[Integer] Ответственный пользователь
        #   Значение по умолчанию
        #     устанавливается текущий пользователь
        attr_accessor :responsible_user_id
        # @return[Integer] Банковской гарантией обеспечиваются следующие обязательства участников конкурса
        #   Возможные значения
        #     0 бит — обязательство не изменять и не отзывать Конкурсную заявку в течение срока ее действия
        #             после истечения срока окончания приема Конкурсных заявок;
        #     1 бит — Обязательство не предоставлять заведомо ложные сведения или намеренно не искажать информацию
        #             или документы, приведенные в составе Конкурсной заявки;
        #     2 бит — Обязательство подписать Протокол о результатах конкурса, в случае признания Участника конкурса
        #             Победителем конкурса и должного его уведомления об этом;
        #     3 бит — Обязательство заключить Договор в установленном настоящей Конкурсной документацией порядке
        #     Если поле guarantee = 0, либо отсутствует, то банковская гарантия не используется.
        attr_accessor :guarantee
        # @return[Double] Размер обеспечения банковской гарантии в процентах
        attr_accessor :guarantee_amount
        # @return[String] Дата начала действия гарантии. Формат значения dd.mm.YYYY
        attr_accessor :guarantee_valid_from
        # @return[String] Срок действия гарантии до. Формат значения dd.mm.YYYY
        attr_accessor :guarantee_valid_to
        # @return[Integer] Тип цены, который будет использоваться при оценке предложений участников и выборе победителя
        #   Возможны варианты:
        #     0 — цена с НДС
        #     1 — цена без НДС
        attr_accessor :price_main
        # @return[Integer] Альтернативные предложения
        # 1 — Альтернативные предложения разрешены
        attr_accessor :alternative_offers
        # @return[String] URL конкурса на площадке B2B.
        # Поле возвращается при вызове метода RemoteTender.getData.
        # В других случаях значение этого поля игнорируется.
        # Формат значения VARCHAR(255)
        attr_accessor :url
        # @return[String] Дата и время рассмотрения заявок (обязательно для организаций, работающих по 223-ФЗ).
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :consideration_date
        # @return[String] Место рассмотрения заявок (обязательно для организаций, работающих по 223-ФЗ).
        # Формат значения VARCHAR(255)
        attr_accessor :consideration_place
        # @return[String] Телефон ответственного пользователя (только для организаций, работающих по 223-ФЗ).
        # Формат значения VARCHAR(255)
        attr_accessor :responsible_user_phone
        # @return[String] E-mail ответственного пользователя (только для организаций, работающих по 223-ФЗ).
        # Формат значения VARCHAR(255)
        attr_accessor :responsible_user_email
        # @return[Integer] ID организации заказчика (только когда организатор конкурса не является заказчиком)
        attr_accessor :customer_firm_id
        # @return[String] Фактический адрес заказчика (только для организаций, работающих по 223-ФЗ).
        # Формат значения VARCHAR(255)
        attr_accessor :customer_fact_address
        # @return[String] Почтовый адрес заказчика (только для организаций, работающих по 223-ФЗ).
        # Формат значения VARCHAR(255)
        attr_accessor :customer_post_address
        # @return[Time] Дата и время подведения итогов (обязательно для организаций, работающих по 223-ФЗ).
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :summarizing_date
        # @return[String] Место подведения итогов (обязательно для организаций, работающих по 223-ФЗ).
        # Формат значения VARCHAR(255)
        attr_accessor :summarizing_place

        # @return [TenderData]
        def self.from_response(response, client, tender_id)
          r = response.result[:tender_data]
          return if r.nil?

          t = TenderData.new
          t.soap_client = client
          t.id = tender_id
          t.open = convert(r[:open], :integer)
          t.common_name = r[:common_name]
          t.lots = Lot.from_response(r[:lots])
          t.date_job_begin = convert(r[:date_job_begin], :date)
          t.date_job_end = convert(r[:date_job_end], :date)
          t.date_unsealing = convert(r[:date_unsealing], :time)
          t.date_unsealing_comment = convert(r[:date_unsealing_comment], :integer)
          t.committee = r[:committee]
          t.participants = r[:participants]
          t.date_qualification = convert(r[:date_qualification], :time)
          t.qualification_documents = r[:qualification_documents]
          t.tender_documents = r[:tender_documents]
          t.applications_deposit = r[:applications_deposit]
          t.competitive_offers = r[:competitive_offers]
          t.unsealing = r[:unsealing]
          t.price_only = convert(r[:price_only], :integer)
          t.winner = r[:winner]
          t.initial_price = convert(r[:initial_price], :float)
          t.protocol_currency = convert(r[:protocol_currency], :integer)
          t.additional_information = r[:additional_information]
          t.haggling = convert(r[:haggling], :integer)
          t.sel_dep_id = convert(r[:sel_dep_id], :integer)
          t.responsible_user_id = convert(r[:responsible_user_id], :integer)
          t.guarantee = convert(r[:guarantee], :integer)
          t.guarantee_amount = convert(r[:guarantee_amount], :float)
          t.guarantee_valid_from = convert(r[:guarantee_valid_from], :date)
          t.guarantee_valid_to = convert(r[:guarantee_valid_to], :date)
          t.price_main = convert(r[:price_main], :integer)
          t.alternative_offers = convert(r[:alternative_offers], :integer)
          t.url = r[:url]
          t.consideration_date = convert(r[:consideration_date], :time)
          t.consideration_place = r[:consideration_place]
          t.responsible_user_phone = r[:responsible_user_phone]
          t.responsible_user_email = r[:responsible_user_email]
          t.customer_firm_id = convert(r[:customer_firm_id], :integer)
          t.customer_fact_address = r[:customer_fact_address]
          t.customer_post_address = r[:customer_post_address]
          t.summarizing_date = convert(r[:summarizing_date], :time)
          t.summarizing_place = r[:summarizing_place]
          t
        end

        # @return [TenderParticipant[]] Информация об организации
        def participants
          remote_tender.get_participants(id)
        end
      end
    end
  end
end
