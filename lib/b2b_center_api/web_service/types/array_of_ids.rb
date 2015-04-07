require 'b2b_center_api/web_service/types/base'

module B2bCenterApi
  module WebService
    module Types
      # Массив ID или других строк
      class ArrayOfIds < Base
        # @return [String[]]
        def self.from_part_response(response)
          return if response.nil?
          to_array(response).map { |n| convert(n[:string], :string) }
        end
      end
    end
  end
end
