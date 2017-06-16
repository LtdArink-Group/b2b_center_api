module B2bCenterApi
  module WebService
    module Types
      # Предложение
      class AuctionOffer < WebService::BaseType
        # @return [Integer] Номер аукциона/объявления
        attr_accessor :auction_id
        # @return [Integer] ID организации (участник торговой процедуры)
        attr_accessor :firm_id
        # @return [Integer] = 0 — основное предложение = целое_число — альтернативное предложение №
        attr_accessor :offer_num
        # @return [Float] Последняя ставка. Формат значения DECIMAL(15,2)
        attr_accessor :final_price
        # @return [Float] Последняя ставка без НДС. Формат значения DECIMAL(15,2)
        attr_accessor :final_price_notax
        # @return [Float] Последняя ставка за единицу. Заполняется для непопозиционных процедур.
        # Формат значения DECIMAL(15,2)
        attr_accessor :final_price_unit
        # @return [Float] Последняя ставка за единицу без НДС. Заполняется для непопозиционных процедур.
        # Формат значения DECIMAL(15,2)
        attr_accessor :final_price_unit_notax
        # @return [Float] НДС последней ставки. Заполняется для непопозиционных процедур
        attr_accessor :final_tax
        # @return [Time] Дата последней ставки.
        attr_accessor :final_bet_date
        # @return [Boolean] 1 — победитель, 0 — не победитель. Формат значения INT(1)
        attr_accessor :winner
        # @return [Integer] Количество ставок
        attr_accessor :bets
        # Файлы предложения. Поле содержит список записей типа file, в случае если у текущего
        # пользователя нет доступа к файлу, то поле file.name — не заполняется.
        # @return [B2bCenterApi::WebService::Types::B2bFile[]]
        attr_accessor :files
        # @return [HagglingFiles] Файлы на переторжку (в случае, если конверты на данный этап переторжки были вскрыты)
        attr_accessor :haggling_files
        # @return [AuctionOfferField] Массив дополнительных полей предложения
        attr_accessor :offer_fields
        # @return [AuctionPositionOffer] Массив предложений участника по позициям
        attr_accessor :positions_offers
        # @return [String] ФИО пользователя, отправившего заявку
        attr_accessor :user_fullname
        # @return [String] E-mail пользователя, отправившего заявку
        attr_accessor :user_email
        # @return [String] Номер телефона пользователя, отправившего заявку
        attr_accessor :user_phone

        # @return [AuctionOffer]
        def self.from_response(response, client, auction_id, firm_id, offer_num)
          r = response.result[:auction_offer]
          return if r.nil?
          t = AuctionOffer.new
          t.soap_client = client
          t.auction_id = auction_id
          t.firm_id = firm_id
          t.offer_num = offer_num
          t.final_price = convert(r[:final_price], :float)
          t.final_price_notax = convert(r[:final_price_notax], :float)
          t.final_price_unit = convert(r[:final_price_unit], :float)
          t.final_price_unit_notax = convert(r[:final_price_unit_notax], :float)
          t.final_tax = convert(r[:final_tax], :float)
          t.final_bet_date = convert(r[:final_bet_date], :time)
          t.winner = convert(r[:winner], :boolean)
          t.bets = convert(r[:bets], :integer)
          t.files = B2bFile.from_part_response(r[:files])
          t.haggling_files = r[:haggling_files]
          t.offer_fields = r[:offer_fields]
          t.positions_offers = r[:positions_offers]
          t.user_fullname = convert(r[:user_fullname], :string)
          t.user_email = convert(r[:user_email], :string)
          t.user_phone = convert(r[:user_phone], :string)

          t
        end
      end
    end
  end
end
