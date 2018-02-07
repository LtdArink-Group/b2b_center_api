module B2bCenterApi
  module WebService
    module Types
      # Дополнительное поле лота значение
      class AuctionLotFieldValue < WebService::BaseType

        def initialize(args = {})
          @id = args[:id]
          @value = args[:value]
          @option = args[:option]
          @text = args[:text]
        end

        # @return [Integer] ID доп. поля.
        # При создании торговой процедуры использовать ID дополнительных полей, добавленных в личный кабинет
        attr_accessor :id

        # @return [String] Значение.
        # Указывается, если дополнительное поле не является выпадающим списком
        attr_accessor :value

        # @return [String] Значение (номер выбранной опции начиная с 0).
        # Указывается, если дополнительное поле является выпадающим списком
        attr_accessor :option

        # @return [String] Пользовательский текст.
        # Eсли дополнительное поле является выпадающим списком и
        # выбранная опция позволяет вводить пользовательский текст
        attr_accessor :text
      end
    end
  end
end
