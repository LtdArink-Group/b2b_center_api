module B2bCenterApi
  module WebService
    class Response
      attr_reader :body, :ret, :status, :result

      def initialize(response)
        @body = response.body
        @ret = @body.values[0][:return]
        @status = @ret[:status]
        @result = @ret.values[1]
      end
    end
  end
end
