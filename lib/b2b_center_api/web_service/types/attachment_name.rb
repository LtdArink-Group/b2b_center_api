require 'digest'

module B2bCenterApi
  module WebService
    module Types
      # Файл для отправки
      class AttachmentName < WebService::BaseType

        # @return [String] Имя файла
        attr_reader :filename

        # @return [String] MD5 от содержимого файла
        attr_reader :md5

        def initialize(file_path)
          file = File.new(file_path)
          @filename = File.basename(file_path)
          @md5 = Digest::MD5.hexdigest(file.read)
        end

        # Подготовка массива AttachmentName для отправки
        # @param files_array [Array] Массив файлов
        # @return [Array] Массив хешей для отправки по SOAP
        def self.from_array(files_array)
          files_array.map do |file|
            { file: new(file).to_h }
          end
        end
      end
    end
  end
end
