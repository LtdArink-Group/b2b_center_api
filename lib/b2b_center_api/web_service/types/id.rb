module B2bCenterApi
  module WebService
    module Types
      # ID
      class Id < WebService::BaseType

        def self.from_response(response)
          r = response.result
          return if r.nil?
          convert(r[:value], :Integer)
        end
      end
    end
  end
end
