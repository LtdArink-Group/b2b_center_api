module B2bCenterApi
  module WebService
    module Types
      # Конкурс
      class AuctionData < WebService::BaseType
        # @return [Integer] id аукциона/объявления
        # При создании нового аукциона это поле можно опустить, либо =0
        attr_accessor :id
        # @return [Integer] Тип процедуры
        #   Возможные значения
        #     1 — аукцион продавца
        #     2 — аукцион покупателя
        #     3 — объявление о продаже
        #     4 — запрос предложений (объявление о покупке)
        #    14 — простая процедура закупки
        attr_accessor :type
        # @return [Integer] Способ закупки (только если тип процедуры 4)
        #   Возможные значения
        #     0 — запрос предложений
        #     1 — запрос цен
        attr_accessor :board_extended_type
        # @return [Integer] Поле, необходимое для создания многолотовых запросов предложений
        #   Возможные значения
        #     0 — при однолотовом запросе или первом лоте многолотового
        #    id — Номер многолотового запроса предложений в который необходимо добавить лот
        attr_accessor :auction_id
        # @return [Integer] Номер лота в многолотовом запросе предложений
        #   Возможные значения
        #     0 — для создания однолотового запроса предложений
        #     N — для многолотового, где N - порядковый номер лота в многолотовом запросе предложений
        #         (1 для первого в сочетании с auction_id = 0 и больше 1 в сочетании с auction_id = id)
        attr_accessor :number_in_group
        # @return [String]
        # ID подразделения
        attr_accessor :department_id
        # @return [String] Категории классификоторов
        # Перечисление категорий классификатора через ,
        attr_accessor :classifier_ids
        # @return [String] Код ОКВЭД
        attr_accessor :okved_code
        # @return [String] Наименование продукции
        attr_accessor :name
        # @return [String] Краткое описание лота
        attr_accessor :comments
        # @return [Integer] Услуга
        # ID услуги - список можно получить вызвав RemoteMarket.getServices()
        # Пустая строка - нет описания
        attr_accessor :service
        # @return [String] Ссылка на подробное описание продукции
        attr_accessor :link_url
        # @return [Double] Количество продукции
        attr_accessor :quantity
        # @return [String] Ед. измерения продукции
        attr_accessor :units
        # @return [String] Цена за ед. продукции
        # Формат значения Decimal(15, 2)
        attr_accessor :price_unit
        # @return [String] Цена за ед. продукции без НДС
        # Формат значения Decimal(15, 2)
        attr_accessor :price_unit_notax
        # @return [String] Цена за весь лот
        # Формат значения Decimal(15, 2)
        attr_accessor :price_lot
        # @return [String] Цена за весь лот без НДС
        # Формат значения Decimal(15, 2)
        attr_accessor :price_lot_notax
        # @return [Integer] Тип цены, который будет использоваться при выборе победителя
        #   Возможные значения
        #     0 — цена с НДС
        #     1 — цена без НДС
        attr_accessor :price_main
        # @return [Integer] Победитель конкурса
        #   Валюта:
        #     0 — руб,
        #     1 — USD,
        #     2 — EUR,
        #     4 — UAH
        attr_accessor :currency
        # @return [String] Шаг аукциона
        # Шаг аукциона не может быть меньше 0,01% и больше 1% от начальной цены всего лота.
        # Формат значения DECIMAL(15,2)
        attr_accessor :bet_step
        # @return [String] Условия оплаты
        attr_accessor :conditions
        # @return [String] Местонахождение и условия поставки
        attr_accessor :place
        # @return [array_of_ids] @deprecated
        # Дополнительная информация.
        # ID файлов, размещенных в папке "Предложение" Личного кабинета в разделе "Дополнительная информация".
        attr_accessor :files
        # @return [String] Комментарии
        attr_accessor :description
        # @return [String] Список ID файлов с информацией о процедуре, через запятую.
        # Формат значения VARCHAR(255)
        attr_accessor :info_files
        # @return [String] Действительно до
        # Срок действия объявления
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_end
        # @return [String] Дата вскрытия конвертов с предложениями.
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_end_unsealing
        # @return [String] Дата начала торгов
        # Поле заполняется для объявления двухэтапных объявлений о продаже или запросах предложений
        # Поле является обязательным при объявлении аукциона.
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_start
        # @return [String] Дата вскрытия конвертов с предварительной документацией
        # Поле заполняется для объявления двухэтапных объявлений о продаже или запросах предложений.
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :date_unsealing
        # @return [Integer] Ответственный пользователь.
        # По умолчанию — устанавливается текущий пользователь
        attr_accessor :responsible_user_id
        # @return [ArrayOfIds] Место поставки товара или оказания услуги.
        # Список адресов организации возвращает метод RemoteMarket.getAddressesIds.
        attr_accessor :addresses_ids
        # @return [Integer]
        # 1 — Альтернативные предложения разрешены
        attr_accessor :alternative_offers
        # @return [String] URL торговой процедуры на площадке B2B
        # Поле возвращается при вызове метода RemoteAuction.getData
        #  В других случаях значение этого поля игнорируется
        # Формат значения VARCHAR(255)
        attr_accessor :url
        # @return [Integer]
        # ID организации заказчика (указывается в случае, когда организатор торговой процедуры не является заказчиком)
        attr_accessor :customer_firm_id
        # @return [String] Телефон ответственного пользователя.
        # Например — +7(495)1234567.
        # Формат значения код_страны(код_города)телефон
        attr_accessor :organizer_phone
        # @return [String] E-mail ответственного пользователя (только для организаций, работающих по 223-ФЗ)
        # Формат значения VARCHAR(255)
        attr_accessor :organizer_email
        # @return [String] Фактический адрес заказчика (только для организаций, работающих по 223-ФЗ)
        # Формат значения VARCHAR(255)
        attr_accessor :organizer_fact_address
        # @return [String] Почтовый адрес заказчика (только для организаций, работающих по 223-ФЗ)
        # Формат значения VARCHAR(255)
        attr_accessor :organizer_post_address
        # @return [Integer] Признак того, требуется ли обязательная подгрузка документации к предложению
        # (для запросов предложений)
        #   Возможные значения
        #     0 — не обязательна;
        #     1 — обязательна.
        # При отсутствии данного поля загрузка документации к предложению обязательна.
        attr_accessor :require_offer_doc
        # @return [Integer] Признак того, что торги являются попозиционными.
        #   Возможные значения
        #     0 — обычные
        #     1 — попозиционные (Тип процедуры — Запрос предложений)
        # Возвращается методом getData только если «1».
        attr_accessor :multiposition
        # @return [Integer] Признак того, что позиции попозиционных торгов объединяются в лоты.
        #   Возможные значения
        #     0 — обычные торги
        #     1 — попозиционные торги с объединением позиций в лоты
        # Возвращается методом getData только если «1».
        # Внимание! Понятия «попозиционная процедура с объединением позиций в лоты» и «Многолотовая процедура»
        #   отличаются механизмом проведения торгов и подведения итогов:
        #   в многолотовой процедуре каждый лот является, по сути, отдельной торговой процедурой с отдельной процедурой подведения итогов;
        #   лот же попозиционной процедуры это атомарная группа позиций, обеспечивающая невозможность участия или выбора победителя не по всем позициям любого лота.
        # Подведение итогов попозиционной процедуры с объединением позиций в лоты происходит единовременно для всех
        # лотов — так же, как и в случае обычной попозиционной процедуры.
        attr_accessor :allow_positions_groups
        # @return [Integer] Признак возможности добавлять закупочные позиции без указания цены
        # (в попозиционных запросах предложений)
        #   Возможные значения
        #     0 — запрещено (по умолчанию)
        #     1 — разрешено
        # Возвращается методом getData только если «1».
        attr_accessor :allow_positions_no_price
        # @return [String] Дата и время рассмотрения заявок
        # Обязательно для заполнения для организаций, которые работают по 223-ФЗ
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :consideration_date
        # @return [String] Место рассмотрения заявок
        # Обязательно для заполнения для организаций, которые работают по 223-ФЗ.
        # Формат значения VARCHAR(255)
        attr_accessor :consideration_place
        # @return [String] Дата и время подведения итогов
        # Обязательно для заполнения для организаций, которые работают по 223-ФЗ
        # Формат значения dd.mm.YYYY HH:ii:ss
        attr_accessor :results_date
        # @return [Integer] Выгружать на ООС
        #   Возможные значения:
        #     0 — не выгружать
        #     1 — выгружать
        attr_accessor :zgr_export
        # @return [String] Является ли торговая процедура двухэтапной
        #   Возможные значения
        #     0 — является одноэтапной
        #     1 — является двухэтапной
        attr_accessor :multi_stages
        # @return [Integer] Является ли торговая процедура закрытой.
        #   Возможные значения:
        #     0 — является открытой
        #     1 — является закрытой
        attr_accessor :is_private
        # @return [Integer] Разрешена ли подача аналогов позиций (для попозиционных процедур)
        #   Возможные значения:
        #     0 — не разрешена
        #     1 — разрешена
        attr_accessor :allow_positions_analog
        # @return [Integer] Атрибут малой закупки
        #   Возможные значения:
        #     0 — не устанавливать атрибут малой закупки
        #     1 — установить атрибут малой закупки
        attr_accessor :small_purchase
        # @return [Integer] Номер конкурса на заключение рамочного соглашения,
        #                   победители которого допускаются к участию в данной торговой процедуре
        attr_accessor :tender_id
        # @return [Integer] Номер лота конкурса на заключение рамочного соглашения,
        #                   победители которого допускаются к участию в данной торговой процедуре
        attr_accessor :tender_lot_id
        # @return [Integer] подтип унивесальной многолотовой закупки
        #   Возможные значения:
        #     1 — Конкурс
        #     2 — Конкурс
        #     3 — Запрос предложений
        #     4 — Запрос цен
        #     5 — Аукционы
        #     6 — Редукционы
        attr_accessor :trade_type_code
        # @return [Integer] Контейнер многолотовой процедуры
        #   Возможные значения:
        #     0 — не контейнер
        #     1 — контейнер
        attr_accessor :root
        # @return [Integer] номер контейнера многолотовой процедуры
        attr_accessor :root_id
        # @return [Integer] номер лота многолотовой процедуры
        attr_accessor :lot_id
        # @return [Integer] Использовать ли попозиционное задание торгов
        #   Возможные значения:
        #     0 — не использовать
        #     1 — использовать
        attr_accessor :use_positions
        # @return [Integer] Использовать ли закрытую подачу предложений
        #   Возможные значения:
        #     0 — не использовать
        #     1 — использовать
        attr_accessor :private_offers
        # @return [Integer] Требование к отсутствию участников закупки в реестре недобросовестных поставщиков
        # Только для процедур по 223-ФЗ
        #   Возможные значения:
        #     0 — не использовать
        #     1 — использовать
        attr_accessor :zgr_not_dishonest_firm
        # @return [Integer] Разрешить участие в закупке только субъектам малого и среднего предпринимательства
        # Только для процедур по 223-ФЗ
        #   Возможные значения:
        #     0 — не разрешать
        #     1 — разрешить
        attr_accessor :only_for_smb
        # @return [Integer] В отношении участников закупки установлено требование о привлечении к исполнению договора субподрядчиков из числа МСП
        # Только для процедур по 223-ФЗ
        #   Возможные значения:
        #     0 — не установлено
        #     1 — установлено
        attr_accessor :attract_subcontractors_smb

        # @return [Integer]
        # Разрешить ли торги за единицу.
        #   Возможные значения:
        #     "0" — не разрешать;
        #     "1" — разрешить
        attr_accessor :trading_per_unit

        # @return [Integer]
        # Включить рангирование заявок.
        #   Возможные значения:
        #     "0" — не включать;
        #     "1" — включить
        attr_accessor :rating_offers_mode

        # @return [RangeFloat]
        # Диапазон ставок участников в процентах от начальной стоимости лота.
        # Возможность использования предоставляется оператором, при ее наличии поле обязательно
        attr_accessor :variable_bet_step

        # @return [BoardProcMinStep] Минимальный шаг.
        # Указывается в запросах цен/предложений. Возможность указания предоставляется оператором
        attr_accessor :min_step

        # @return [ProcGkpzData]
        # Год и номер строки плана, которой соответствует торговая процедура.
        # Только для процедур по 223-ФЗ
        attr_accessor :gkpz_fields

        # @return [ArrayOfIds]
        # Номера ПКО, если требуется провести процедуру по результатам предварительного квалификационного отбора (отборов)
        attr_accessor :src_qualification_ids

        # @return [AuctionAdditionalTradingField]
        # Дополнительные поля извещения торговой процедуры.
        # Возможность их использования предоставляется оператором
        attr_accessor :additional_trading_fields

        # @return [AuctionLotFieldValue]
        # Дополнительные поля торговой процедуры (дополнительные поля лотов).
        # Устанавливаются в личном кабинете или методом RemoteMarket.addLotFields.
        # Возможность их использования предоставляется оператором
        attr_accessor :lot_fields

        # @return [String]
        # Место вскрытия конвертов.
        # Адрес места, где состоится вскрытие конвертов с конкурсными заявками.
        # Формат значения: VARCHAR(2048)
        attr_accessor :unsealing_place

        # @return [String]
        # Конкурсная комиссия.
        # Информация о Конкурсной комиссии: порядок ее формирования, ФИО и контактную информацию ответственного секретаря (телефон, факс, адрес электронной почты), ее адрес.
        # Формат значения: VARCHAR(2048)
        attr_accessor :committee_info

        # @return [String]
        # Конкурсная комиссия.
        # Требования к участникам конкурса, в том числе
        #   тип и деятельность приглашаемой организации (например, специализированные организации, которые самостоятельно или с привлечением субподрядчиков могут обеспечить выполнение всего объема требуемых работ);
        #   наличие лицензий, квалификацию персонала, производственно-техническую мощность и имущество участника;
        #   финансовое положение участника (не должен быть неплатежеспособным, банкротом, не должен находиться в процессе ликвидации, имущество не должно быть под арестом, в залоге и пр.).
        # Формат значения: VARCHAR(2048)
        attr_accessor :participants_requirements

        # @return [String] Комплект конкурсной документации.
        # Место, время и условия получения конкурсной документации.
        # Формат значения: VARCHAR(2048)
        attr_accessor :documents_info

        # @return [String] Обеспечение обязательств по договору
        # Дополнительная информация об обеспечении. Например, правила учета обеспечения, условия и сроки его возврата и пр.
        # Формат значения: VARCHAR(2048)
        attr_accessor :applications_deposit

        # @return [String]
        # Конкурсные заявки
        # Требования к оформлению конкурсных заявок (на каком языке должна составляться заявка, учитывается ли НДС в ценовом предложении и т.п.).
        # Формат значения: VARCHAR(2048)
        attr_accessor :competitive_offers_requirements

        # @return [String]
        # Дата начала поставки товаров, проведения работ, оказания услуг.
        # Формат значения: dd.mm.yyyy
        attr_accessor :date_job_begin

        # @return [String]
        # Дата окончания поставки товаров, проведения работ, оказания услуг.
        # Формат значения: dd.mm.yyyy
        attr_accessor :date_job_end

        # @return [String]
        # Место подведения итогов.
        # Формат значения: VARCHAR(2048)
        attr_accessor :place_summarizing

        # return [AuctionData]
        def self.from_response(response, client, tender_id)
          r = response.result[:data]
          return if r.nil?

          t = AuctionData.new
          t.soap_client = client
          t.id = convert(r[:id], :integer)
          t.type = convert r[:type], :integer
          t.board_extended_type = convert r[:board_extended_type], :integer
          t.auction_id = convert r[:auction_id], :integer
          t.number_in_group = convert r[:number_in_group], :integer
          t.department_id = r[:department_id]
          t.classifier_ids = r[:classifier_ids]
          t.okved_code = r[:okved_code]
          t.name = r[:name]
          t.comments = r[:comments]
          t.service = convert r[:service], :integer
          t.link_url = r[:link_url]
          t.quantity = convert r[:quantity], :float
          t.units = r[:units]
          t.price_unit = r[:price_unit]
          t.price_unit_notax = r[:price_unit_notax]
          t.price_lot = r[:price_lot]
          t.price_lot_notax = r[:price_lot_notax]
          t.price_main = r[:price_main]
          t.currency = r[:currency]
          t.bet_step = r[:bet_step]
          t.conditions = r[:conditions]
          t.place = r[:place]
          t.files = r[:files]
          t.description = r[:description]
          t.info_files = r[:info_files]
          t.date_end = r[:date_end]
          t.date_end_unsealing = r[:date_end_unsealing]
          t.date_start = r[:date_start]
          t.date_unsealing = r[:date_unsealing]
          t.responsible_user_id = r[:responsible_user_id]
          t.addresses_ids = r[:addresses_ids]
          t.alternative_offers = r[:alternative_offers]
          t.url = r[:url]
          t.customer_firm_id = r[:customer_firm_id]
          t.organizer_phone = r[:organizer_phone]
          t.organizer_email = r[:organizer_email]
          t.organizer_fact_address = r[:organizer_fact_address]
          t.organizer_post_address = r[:organizer_post_address]
          t.require_offer_doc = r[:require_offer_doc]
          t.multiposition = r[:multiposition]
          t.allow_positions_groups = r[:allow_positions_groups]
          t.allow_positions_no_price = r[:allow_positions_no_price]
          t.consideration_date = r[:consideration_date]
          t.consideration_place = r[:consideration_place]
          t.results_date = r[:results_date]
          t.zgr_export = r[:zgr_export]
          t.multi_stages = r[:multi_stages]
          t.is_private = r[:is_private]
          t.allow_positions_analog = r[:allow_positions_analog]
          t.small_purchase = r[:small_purchase]
          t.tender_id = r[:tender_id]
          t.tender_lot_id = r[:tender_lot_id]
          t.trade_type_code = r[:trade_type_code]
          t.root = r[:root]
          t.root_id = r[:root_id]
          t.lot_id = r[:lot_id]
          t.use_positions = r[:use_positions]
          t.private_offers = r[:private_offers]
          t.zgr_not_dishonest_firm = r[:zgr_not_dishonest_firm]
          t.only_for_smb = r[:only_for_smb]
          t.attract_subcontractors_smb = r[:attract_subcontractors_smb]
          t.trading_per_unit = r[:trading_per_unit]
          t.rating_offers_mode = r[:rating_offers_mode]
          t.variable_bet_step = r[:variable_bet_step]
          t.min_step = r[:min_step]
          t.gkpz_fields = r[:gkpz_fields]
          t.src_qualification_ids = ArrayOfIds.from_part_response(r[:src_qualification_ids]).flatten
          t.additional_trading_fields = r[:additional_trading_fields]
          t.lot_fields = r[:lot_fields]
          t.unsealing_place = r[:unsealing_place]
          t.committee_info = r[:committee_info]
          t.participants_requirements = r[:participants_requirements]
          t.documents_info = r[:documents_info]
          t.applications_deposit = r[:applications_deposit]
          t.competitive_offers_requirements = r[:competitive_offers_requirements]
          t.date_job_begin = convert(r[:date_job_begin], :date)
          t.date_job_end = convert r[:date_job_end], :date
          t.place_summarizing = convert r[:place_summarizing], :date
          t
        end

        # @return [AuctionParticipant[]] Информация участниках
        def participants
          remote_auction.get_participants(id)
        end
      end
    end
  end
end
