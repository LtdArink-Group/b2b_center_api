module B2bCenterApi
  module WebService
    module Types
      # Файл
      class B2bFile < WebService::BaseType
        # @return [String] Наименование файла. Формат значения VARCHAR(255)
        attr_accessor :title

        # @return [String] Описание файла
        attr_accessor :description

        # Имя файла, например zayavka.doc.
        # Файл расположен в корневой папке пользователя (доступ по FTP).
        # Если пользователь не имеет прав для скачивания файла, то поле отсутствует.
        # Формат значения VARCHAR(255)
        # @return [String]
        attr_accessor :name

        # @return [B2bFile[]]
        def self.from_part_response(response)
          return if response.nil?
          files = to_array(response[:file]).map do |f|
            file = B2bFile.new
            file.title = convert(f[:title], :string)
            file.description = convert(f[:description], :string)
            file.name = convert(f[:name], :string)
            file
          end
          files
        end
      end
    end
  end
end
