module B2bCenterApi
  module WebService
    module Types
      # Список доступных услуг
      class ArrayOfServices < WebService::BaseType
        # @return [ServiceRow]
        def self.from_response(response)
          r = response.result
          return if r.nil?
          Array(r[:services]).map do |service|
            ServiceRow.new(service)
          end
        end
      end
    end
  end
end
