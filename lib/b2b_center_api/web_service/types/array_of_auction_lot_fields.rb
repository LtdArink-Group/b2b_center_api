module B2bCenterApi
  module WebService
    module Types
      # Список дополнительных полей лотов организации
      class ArrayOfAuctionLotFields < WebService::BaseType
        # @return [AuctionLotField[]]
        def self.from_response(response)
          r = response.result
          return if r.nil?
          Array(r[:lot_fields][:lot_field]).map do |lot_field|
            AuctionLotField.new(lot_field)
          end
        end
      end
    end
  end
end
