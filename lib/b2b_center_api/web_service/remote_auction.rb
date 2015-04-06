require 'b2b_center_api/web_service/remote'

module B2bCenterApi
  module WebService
    class RemoteAuction < Remote
      def soap_method_prefix
        'remote_auction'
      end
    end
  end
end
