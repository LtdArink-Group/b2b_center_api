module B2bCenterApi
  module WebService
    module Types
      # Информация об организации
      class FirmInfo < WebService::BaseType
        # @return [Integer] ID организации
        attr_accessor :firm_id
        # @return [Time] Дата последнего изменения
        attr_accessor :date_lastedit
        # @return [String] Полное наименование организации. Формат значения VARCHAR(255)
        attr_accessor :org_name
        # @return [String] Краткое наименование организации. Формат значения VARCHAR(255)
        attr_accessor :org_name_short
        # @return [String] Код ОКПО. Формат значения VARCHAR (10)
        attr_accessor :code_okpo
        # @return [String] Название банка. Формат значения VARCHAR(255)
        attr_accessor :bank_name
        # @return [String] ИНН организации. Формат значения VARCHAR(30)
        attr_accessor :bank_inn
        # @return [String] ОГРН. Формат значения VARCHAR(15)
        attr_accessor :ogrn
        # @return [String] Кем выдан ОГРН. Формат значения VARCHAR(128)
        attr_accessor :ogrn_given
        # @return [Date] Дата выдачи ОГРН. Формат значения dd.mm.YYYY
        attr_accessor :ogrn_date_given
        # @return [String] КПП организации. Формат значения VARCHAR(12)
        attr_accessor :bank_kpp
        # @return [String] БИК. Формат значения VARCHAR(30)
        attr_accessor :bank_bik
        # @return [String] Расчетный счет. Формат значения VARCHAR(30)
        attr_accessor :bank_r_account
        # @return [String] Корреспондентский счет. Формат значения VARCHAR(30)
        attr_accessor :bank_c_account
        # @return [String] Комментарии к банковским реквизитам. Формат значения VARCHAR(255)
        attr_accessor :bank_comments
        # @return [String] Юридический адрес. Формат значения VARCHAR(255)
        attr_accessor :jury_address
        # @return [String] Почтовый адрес. Формат значения VARCHAR(255)
        attr_accessor :post_address
        # @return [String] Фактический адрес. Формат значения VARCHAR(255)
        attr_accessor :fact_address
        # @return [String] Адрес веб-сайта. Формат значения VARCHAR(255)
        attr_accessor :site_url
        # @return [String] Информация о сертификации продукции, работ и услуг
        attr_accessor :certification
        # @return [String] Регистрационные данные. Поле заполняется только для иностранных организаций.
        attr_accessor :org_details
        # @return [String] Банковские реквизиты. Поле заполняется только для иностранных организаций.
        attr_accessor :bank_details
        # @return [Integer] Код страны. Пример: код России = 643
        attr_accessor :country
        # @return [BossesUsers]
        # Руководящий состав организации
        attr_accessor :bosses
        # @return [Boolean] Соответствует ли участник критериям СМП (среднего или малого предпринимательства)
        attr_accessor :is_smb
        # @return [FirmInfoPhone]
        # Телефоны организации
        attr_accessor :phones

        # @return [FirmInfo]
        def self.from_response(response, client, firm_id)
          r = response.result[:firm_info]
          return if r.nil?
          fi = FirmInfo.new
          fi.soap_client = client
          fi.firm_id = firm_id
          fi.date_lastedit = convert(r[:date_lastedit], :time)
          fi.org_name = convert(r[:org_name], :string)
          fi.org_name_short = convert(r[:org_name_short], :string)
          fi.code_okpo = convert(r[:code_okpo], :string)
          fi.bank_name = convert(r[:bank_name], :string)
          fi.bank_inn = convert(r[:bank_inn], :string)
          fi.ogrn = convert(r[:ogrn], :string)
          fi.ogrn_given = convert(r[:ogrn_given], :string)
          fi.ogrn_date_given = convert(r[:ogrn_date_given], :date)
          fi.bank_kpp = convert(r[:bank_kpp], :string)
          fi.bank_bik = convert(r[:bank_bik], :string)
          fi.bank_r_account = convert(r[:bank_r_account], :string)
          fi.bank_c_account = convert(r[:bank_c_account], :string)
          fi.bank_comments = convert(r[:bank_comments], :string)
          fi.jury_address = convert(r[:jury_address], :string)
          fi.post_address = convert(r[:post_address], :string)
          fi.fact_address = convert(r[:fact_address], :string)
          fi.site_url = convert(r[:site_url], :string)
          fi.certification = convert(r[:certification], :string)
          fi.org_details = convert(r[:org_details], :string)
          fi.bank_details = convert(r[:bank_details], :string)
          fi.country = convert(r[:country], :integer)
          fi.bosses = convert(r[:bosses], :string)
          fi.is_smb = convert(r[:is_smb], :boolean)
          fi.phones = convert(r[:phones], :string)

          fi
        end
      end
    end
  end
end
