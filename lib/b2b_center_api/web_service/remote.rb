require 'b2b_center_api/settings'
require 'b2b_center_api/web_service/response'

module B2bCenterApi
  module WebService
    class Remote
      def command(name, params)
        auth = B2bCenterApi::Settings.auth_options
        params = auth.merge(params)
        res = @client.call(method_fullname(name), message: params)
        Response.new(res)
      end

      def initialize(client)
        @client = client
      end

      private

      def method_fullname(name)
        format('%s_%s', soap_method_prefix, name).to_sym
      end

      # def clean_params(options)
      #   options
      # end
    end
  end
end
