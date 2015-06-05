module B2bCenterApi
  module WebService
    class Response
      attr_reader :body, :ret, :status, :result

      def initialize(response)
        @body = response.body
        @ret = @body.values[0][:return]
        @status = @ret.delete(:status)
        @result = @ret
      end
    end
  end
end
