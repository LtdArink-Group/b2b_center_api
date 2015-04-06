require 'b2b_center_api/web_service/remote'

module B2bCenterApi
  module WebService
    class RemoteMarket < Remote
      def soap_method_prefix
        'remote_market'
      end
    end
  end
end
