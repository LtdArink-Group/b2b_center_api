require 'b2b_center_api/web_service/remote'

module B2bCenterApi
  module WebService
    class RemoteTender < Remote
      def soap_method_prefix
        'remote_tender'
      end
    end
  end
end
