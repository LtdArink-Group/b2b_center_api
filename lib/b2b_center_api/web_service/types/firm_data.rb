module B2bCenterApi
  module WebService
    module Types
      # Информация об организации
      class FirmData < WebService::BaseType
        # @return [Integer] ID организации
        attr_accessor :id
        # @return [String] Краткое наименование организации
        attr_accessor :org_name_short
        # @return [String] Полное наименование организации.
        attr_accessor :org_name
        # @return [String] ОГРН организации.
        attr_accessor :ogrn
        # @return [String] ИНН
        attr_accessor :inn
        # @return [String] Код ОКПО
        attr_accessor :okpo
        # @return [String] КПП
        attr_accessor :bank_kpp

        # @return [FirmData]
        def self.from_response(response, client)
          r = response.result[:firm_data]
          return if r.nil?
          fd = FirmData.new
          fd.soap_client = client
          fd.id = r[:id]
          fd.org_name = convert(r[:org_name], :string)
          fd.org_name_short = convert(r[:org_name_short], :string)
          fd.okpo = convert(r[:okpo], :string)
          fd.inn = convert(r[:inn], :string)
          fd.ogrn = convert(r[:ogrn], :string)
          fd.bank_kpp = convert(r[:bank_kpp], :string)

          fd
        end
      end
    end
  end
end
