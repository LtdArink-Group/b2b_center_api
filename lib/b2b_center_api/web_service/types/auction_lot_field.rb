module B2bCenterApi
  module WebService
    module Types
      # Дополнительное поле лота организации
      class AuctionLotField < WebService::BaseType

        def initialize(args = {})
          @field_id = args[:field_id]
          @field_short_name = args[:field_short_name]
          @field_name = args[:field_name]
          @field_description = args[:field_description]
          @field_units = args[:field_units]
          @field_lot_type = args[:field_lot_type]
          @field_prop_type = args[:field_prop_type]
          @field_select_options = args[:field_select_options]
          @field_hierarchical = args[:field_hierarchical]
          @field_non_obligatory = args[:field_non_obligatory]
          @field_private = args[:field_private]
          @field_sort_order = args[:field_sort_order]
          @field_default_value = args[:field_default_value]
        end

        # @return [Integer] ID доп. поля
        attr_accessor :field_id

        # @return [String] Краткое название доп. поля
        attr_accessor :field_short_name

        # @return [String] Название доп. поля
        attr_accessor :field_name

        # @return [String] Описание доп. поля
        attr_accessor :field_description

        # @return [String] Единица измерения. Указывается только для числовых полей
        attr_accessor :field_units

        # @return [Integer] Тип процедуры
        # Дополнительное поле будет использоваться только в извещениях процедур этого типа.
        # Возможные значения:
        #   "1" — Аукцион продавца;
        #   "2" — Аукцион покупателя;
        #   "3" — Объявление о продаже;
        #   "4" — Запрос предложений;
        #   "19" — Предварительный квалификационный отбор на продажу;
        #   "16" — Предварительный квалификационный отбор;
        #   "20" — Конкурс;
        #   "40" — Предварительный квалификационный отбор
        attr_accessor :field_lot_type

        # @return [Integer] Тип дополнительного поля
        # Возможные значения:
        #   "0" — Строковый;
        #   "1" — Числовой;
        #   "2" — Дата;
        #   "3" — Выпадающий список;
        #   "7" — Адрес
        attr_accessor :field_prop_type

        # @return [Array(Hash)] Список опций, если тип поля — выпадающий список
        attr_accessor :field_select_options

        # @return [Integer] Распространять на ДЗО
        # Возможные значения:
        #   "0" — не распространять (добавить только для текущей организации);
        #   "1" — распространять (добавить для текущей и нижестоящих организаций)
        attr_accessor :field_hierarchical

        # @return [Integer] Необязательное поле
        # Возможные значения:
        #   "0" — обязательное поле (признак выключен);
        #   "1" — необязательное поле (признак включен)
        attr_accessor :field_non_obligatory

        # @return [Integer] Признак приватности данного поля (доступность только организатору)
        # Возможные значения:
        #   "0" — не приватное поле;
        #   "1" — приватное
        attr_accessor :field_private

        # @return [Integer] Порядок сортировки
        attr_accessor :field_sort_order

        # @return [String] Значение по умолчанию (необязательно)
        attr_accessor :field_default_value
      end
    end
  end
end
