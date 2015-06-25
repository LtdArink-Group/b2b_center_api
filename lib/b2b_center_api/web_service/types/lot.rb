module B2bCenterApi
  module WebService
    module Types
      # Конкурс
      class Lot < WebService::BaseType
        # @return[Integer] Номер лота: 1, 2, 3 и т.д. (номер назначается автоматически при сохранении)
        attr_accessor :lot_id
        # @return[String] Название продукции (наименование лота)
        attr_accessor :lot_name
        # @return[String[]] Категории классификатора
        # Перечисление категорий классификатора через запятую. Например: "127512010,43222134"
        attr_accessor :classifier_ids
        # @return[String[]] Коды ОКВЭД (обязательно для заполнения для организаций, работающих по 223-ФЗ)
        attr_accessor :okved_codes
        # @return[Float] Количество.
        # Формат значения DECIMAL(11,3)
        attr_accessor :quantity
        # @return[String] Единицы измерения (код ОКЕИ).
        # Формат значения VARCHAR(20)
        attr_accessor :units
        # @return[Float] Начальная (максимальная) цена с НДС.
        # Если цена не указывается, то price_begin=price_begin_notax=0.
        # Формат значения DECIMAL(18,2)
        attr_accessor :price_begin
        # @return[Float] Начальная (максимальная) цена без НДС.
        # Формат значения DECIMAL(18,2)
        attr_accessor :price_begin_notax
        # @return[Integer[]] Места поставки товара или оказания услуги.
        # Список адресов организации возвращает метод RemoteMarket.getAddressesIds.
        attr_accessor :addresses_ids
        # @return[String] Сведения о заказчике.
        # Формат значения VARCHAR(255)
        attr_accessor :customer
        # @return[String] Альтернативный идентификатор лота
        attr_accessor :ext_id

        def self.from_response(response)
          return if response.nil?
          lots = to_array(response[:lot]).map do |f|
            lot = Lot.new
            lot.lot_id = convert(f[:lot_id], :integer)
            lot.lot_name = f[:lot_name]
            lot.classifier_ids = f[:classifier_ids].split(',')
            lot.okved_codes = ArrayOfIds.from_part_response(f[:okved_codes])
            lot.quantity = convert(f[:quantity], :float)
            lot.units = f[:units]
            lot.price_begin = convert(f[:price_begin], :float)
            lot.price_begin_notax = convert(f[:price_begin_notax], :float)
            lot.addresses_ids = ArrayOfIds.from_part_response(f[:addresses_ids]).flatten.map(&:to_i)
            lot.customer = f[:customer]
            lot.ext_id = f[:ext_id]
            lot
          end
          lots
        end
      end
    end
  end
end
