require 'b2b_center_api/web_service/type_cast'
require 'b2b_center_api/remote_auction'
require 'b2b_center_api/remote_market'
require 'b2b_center_api/remote_tender'

module B2bCenterApi
  module WebService
    module Types
      class Base
        include B2bCenterApi::WebService::TypeCast

        attr_writer :soap_client

        NO_INSPECT_ATTRS = [:@soap_client]

        def inspect
          vars = instance_variables
          NO_INSPECT_ATTRS.each { |a| vars.delete(a) }
          vars = vars.map { |v| "#{v}=#{instance_variable_get(v).inspect}" }
          vars = vars.join(', ')
          "<#{self.class}: #{vars}>"
        end

        private

        def remote_auction
          B2bCenterApi::RemoteAuction.new(@soap_client)
        end

        def remote_market
          B2bCenterApi::RemoteMarket.new(@soap_client)
        end

        def remote_tender
          B2bCenterApi::RemoteTender.new(@soap_client)
        end
      end
    end
  end
end
