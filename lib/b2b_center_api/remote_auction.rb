require 'b2b_center_api/web_service'

module B2bCenterApi
  # Методы класса RemoteAuction
  class RemoteAuction
    def initialize(client)
      @client = client
      @client_web = WebService::RemoteAuction.new(client)
    end

    # Поулчить данные о протоколе вскрытия конвертов с предложениями
    # @param auction_id [Integer] Номер аукциона/объявления
    # @param haggling_num [Integer] Номер этапа переторжки
    #   Допустимые значени:
    #     0 - Основной этап (По умолчанию)
    #     >0 - Этап переторжки с указанным номером
    # @return [AuctionParticipantsProtocol]
    def get_participants_protocol(auction_id, haggling_num = 0)
      response = @client_web.command :get_participants_protocol, auction_id: auction_id, haggling_num: haggling_num
      WebService::Types::AuctionParticipantsProtocol.from_response(response)
    end

    # Загрузить документацию к аукциону/объявлению через url
    # @param auction_id [Integer] Номер аукциона/объявления
    # @param url [String] Путь к файлу
    # @param type [String] Тип документации
    #   Возможные значения:
    #     'docs' - Документация к основному этапу торговой процедуры
    #     'pre_docs' - Документация к предварительному этапу торговой процедуры
    # @param append_mode [Integer] Загружать файлы в режиме добавления
    #   Возможные значения:
    #     0 - Режим замены (старые файлы документации будут удалены)
    #     1 - Режим добавления (старые файлы документации не будут удалены, за исключением совпадающих имен)
    # @return [String] Код ошибки (0 - если успешно)
    def upload_doc_from_url(auction_id, url, type = 'docs', append_mode = 1)
      response = @client_web.command :upload_doc, auction_id: auction_id, type: type, append_mode: append_mode, url: url
      response.status[:error_code]
    end

    # Загрузить документацию к аукциону/объявлению
    # @param auction_id [Integer] Номер аукциона/объявления
    # @param file [String] Путь к файлу
    # @param type [String] Тип документации
    #   Возможные значения:
    #     'docs' - Документация к основному этапу торговой процедуры
    #     'pre_docs' - Документация к предварительному этапу торговой процедуры
    # @param append_mode [Integer] Загружать файлы в режиме добавления
    #   Возможные значения:
    #     0 - Режим замены (старые файлы документации будут удалены)
    #     1 - Режим добавления (старые файлы документации не будут удалены, за исключением совпадающих имен)
    # @return [String] Код ошибки (0 - если успешно)
    def upload_doc(auction_id, file, type = 'docs', append_mode = 1)
      response = @client_web.command_with_attachments :upload_doc, [file], auction_id: auction_id, type: type, append_mode: append_mode, attachment_name: WebService::Types::AttachmentName.new(file).to_h
      response.status[:error_code]
    end

    # Загрузить документацию из нескольких файлов к аукциону/объявлению
    # !Загружает не более двух файлов за раз, иначе ошибка!
    # @param auction_id [Integer] Номер аукциона/объявления
    # @param file [Array] Массив файлов
    # @param type [String] Тип документации
    #   Возможные значения:
    #     'docs' - Документация к основному этапу торговой процедуры
    #     'pre_docs' - Документация к предварительному этапу торговой процедуры
    # @param append_mode [Integer] Загружать файлы в режиме добавления
    #   Возможные значения:
    #     0 - Режим замены (старые файлы документации будут удалены)
    #     1 - Режим добавления (старые файлы документации не будут удалены, за исключением совпадающих имен)
    # @return [String] Код ошибки (0 - если успешно)
    def upload_docs(auction_id, files, type = 'docs', append_mode = 1)
      files = [files] unless files.is_a? Array
      response = @client_web.command_with_attachments :upload_docs, files, auction_id: auction_id, type: type, append_mode: append_mode, attachment_names: WebService::Types::AttachmentName.from_array(files)
      response.status[:error_code]
    end

    # Создать новый аукцион
    # @param auction_data [WebService::Types::AuctionData, Hash] Данные для создания аукциона
    # @return [Integer] id созданной процедуры
    def create(auction_data)
      auction_data = auction_data.to_h unless auction_data.is_a? Hash
      response = @client_web.command :create, data: auction_data
      response.result[:value]
    end

    # Получить данные аукциона
    # @param auction_id [Integer] Номер процедуры
    # @return [WebService::Types::AuctionData]
    def get_data(auction_id)
      response = @client_web.command :get_data, auction_id: auction_id
      WebService::Types::AuctionData.from_response(response, @client, auction_id)
    end

    # Получить список участников
    # @param auction_id [Integer] Номер аукциона/объявления
    # @return [WebService::Types::AuctionParticipant[]]
    def get_participants(auction_id)
      response = @client_web.command :get_participants, auction_id: auction_id
      WebService::Types::AuctionParticipant.from_response(response, @client, auction_id)
    end

    # Получить список идентификаторов лотов многолотовой процедуры
    # @param auction_id [Integer] Номер аукциона/объявления
    # @return [WebService::Types::ArrayOfIds[]]
    def get_group_ids(auction_id)
      response = @client_web.command :get_group_ids, auction_id: auction_id
      WebService::Types::ArrayOfIds.from_response(response)
    end

    # Получить предложение участника
    # Метод возвращает информацию о предложении (альтернативном предложении) участника:
    # последней ставке, имя файла с описанием предложения, информацию о том признан ли участник победителем.
    # Возвращаемый методом файл доступен для скачивания из корневой FTP-папки организации.
    # @param auction_id [Integer] Номер аукциона/объявления
    # @param firm_id [Integer] ID организации (участник торговой процедуры)
    # @param offer_num [Integer] = 0 — основное предложение = целое_число — альтернативное предложение №
    # @return [WebService::Types::AuctionOffer]
    def get_offer(auction_id, firm_id, offer_num)
      response = @client_web.command :get_offer, auction_id: auction_id, firm_id: firm_id, offer_num: offer_num
      WebService::Types::AuctionOffer.from_response(response, @client, auction_id, firm_id, offer_num)
    end
  end
end
