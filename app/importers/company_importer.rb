require 'creek'

class CompanyImporter
  def initialize(file = 'test/fixtures/files/company.xlsx')
    @file_path = file
    @header = nil
    @compaies = []
  end

  def execute
    data = Creek::Book.new(@file_path)
    sheet = data.sheets[0]
    sheet.rows.each_with_index do |row, index|
      if index.zero?
        @header = row.transform_keys{ |key| key[0] }
      else
        row = update_keys(row)
        @compaies << Company.new(prepare_data(row))
      end
    end

    Company.import(@compaies)
  end

  private

  def prepare_data(item)
    {
      name: item['Название'],
      inn: item['ИНН'],
      address: item['Адрес'],
      phone: item['Телефон'],
      email: item['email'],
      okved_id: okved_cache[item['Вид деятельности']]&.id,
      activity_type: item['Вид деятельности']
    }
  end

  def update_keys(row)
    row.transform_keys{ |key| @header[key[0]] }
  end

  def okved_cache
    @okved_cache ||= Okved.all.index_by(&:name)
  end
end
