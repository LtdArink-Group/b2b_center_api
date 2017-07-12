module B2bCenterApi
  module WebService
    module Types
      # ID
      class Id < WebService::BaseType

        def self.from_response(response)
          r = convert( response.result, :Integer)
          return if r.nil?
          r
        end
      end
    end
  end
end