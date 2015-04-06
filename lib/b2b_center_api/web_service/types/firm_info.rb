require 'b2b_center_api/web_service/types/base'

module B2bCenterApi
  module WebService
    module Types
      class FirmInfo < Base
        attr_accessor :date_lastedit,
                      :org_name,
                      :org_name_short,
                      :code_okpo,
                      :bank_name,
                      :bank_inn,
                      :ogrn,
                      :ogrn_given,
                      :ogrn_date_given,
                      :bank_kpp,
                      :bank_bik,
                      :bank_r_account,
                      :bank_c_account,
                      :bank_comments,
                      :jury_address,
                      :post_address,
                      :fact_address,
                      :site_url,
                      :certification,
                      :org_details,
                      :bank_details,
                      :country,
                      # :bosses,
                      :is_smb

        def self.from_response(response, client)
          r = response.result
          fi = FirmInfo.new
          fi.soap_client = client
          fi.date_lastedit = convert(r[:date_lastedit], :time)
          fi.org_name = convert(r[:org_name], :string)
          fi.org_name_short = convert(r[:org_name_short], :string)
          fi.code_okpo = convert(r[:code_okpo], :string)
          fi.bank_name = convert(r[:bank_name], :string)
          fi.bank_inn = convert(r[:bank_inn], :string)
          fi.ogrn = convert(r[:ogrn], :string)
          fi.ogrn_given = convert(r[:ogrn_given], :string)
          fi.ogrn_date_given = convert(r[:ogrn_date_given], :string)
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
          # fi.bosses = convert(r[:bosses], :string)
          fi.is_smb = convert(r[:is_smb], :boolean)

          fi
        end
      end
    end
  end
end
