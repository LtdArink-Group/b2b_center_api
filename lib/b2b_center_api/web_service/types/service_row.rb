module B2bCenterApi
  module WebService
    module Types
      # Список услуг
      class ServiceRow < WebService::BaseType
        # @return [Integer] Номер услуги
        attr_reader :id
        # @return [String] Название услуги
        attr_reader :name
        
        def initialize(args = {})
          @id = args[:id]
          @name = args[:name]
        end
        
      end
    end
  end
end
