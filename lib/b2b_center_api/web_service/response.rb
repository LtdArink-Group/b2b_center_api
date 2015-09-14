require 'b2b_center_api/etp_error'

module B2bCenterApi
  module WebService
    class Response
      attr_reader :body, :ret, :status, :result

      def initialize(response)
        @body = response.body
        @ret = @body.values[0][:return]
        @status = @ret.delete(:status)
        if @status[:error_code] == '0'
          @result = @ret
        else
          fail B2bCenterApi::EtpError,
               format('Код ошибки: %s, Сообщение: %s', @status[:error_code], @status[:error_message])
        end
      end
    end
  end
end
