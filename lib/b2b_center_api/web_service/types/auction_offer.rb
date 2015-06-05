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
          t.final_bet_date = convert(r[:final_bet_date], :time)
          t.winner = convert(r[:winner], :boolean)
          t.bets = convert(r[:bets], :integer)
          t.files = B2bFile.from_part_response(r[:files])

          t
        end
      end
    end
  end
end