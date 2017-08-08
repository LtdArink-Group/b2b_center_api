module B2bCenterApi
  module WebService
    module Types
      class OkdpRow < WebService::BaseType
        # @return [Integer] ID
        attr_accessor :id
        # @return [Integer] родительский ID
        attr_accessor :parent_id
        # @return [String] Наименование
        attr_accessor :name
        # @return [OkdpRow]
        def self.from_response(response)
          r = response.result
          return if r.nil?
          Array(r[:okdp_rows]).map do |okdp|
            o = OkdpRow.new
            o.id = okdp[:id]
            o.parent_id = okdp[:parent_id]
            o.name = okdp[:name]
            o
          end
        end
      end
    end
  end
end
