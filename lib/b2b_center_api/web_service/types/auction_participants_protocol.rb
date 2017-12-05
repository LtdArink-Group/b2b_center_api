module B2bCenterApi
  module WebService
    module Types
      # Участник аукциона
      class AuctionParticipantsProtocol < WebService::BaseType

        # @return [String] Номер протокола
        attr_accessor :number

        # @return [Date] Дата составления протокола
        attr_accessor :date

        # @return [String] Место составления протокола
        attr_accessor :place

        # @return [String] Ссылка на скачивание файла протокола, если организатор загрузил протокол
        attr_accessor :file

        # @return [Time] Дата и время проведения этапа процедуры
        attr_accessor :procedure_stage_date

        # @return [Date] Дата подписания протокола
        attr_accessor :sign_protocol_date

        # @return [ParticipantsProtocol]
        def self.from_response(response)
          r = response.result[:participants_protocol]
          return if r.nil?

          protocol = AuctionParticipantsProtocol.new
          protocol.number = r[:number]
          protocol.date = convert r[:date], :date
          protocol.place = r[:place]
          protocol.file = r[:file]
          protocol.procedure_stage_date = convert r[:procedure_stage_date], :time
          protocol.sign_protocol_date = convert r[:sign_protocol_date], :date
          protocol
        end
      end
    end
  end
end
