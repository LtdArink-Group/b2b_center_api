require 'b2b_center_api/web_service'

module B2bCenterApi
  # Методы класса RemoteTender
  class RemoteTender
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteTender.new(client)
    end
  end
end
