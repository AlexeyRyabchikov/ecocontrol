require 'creek'

class CompanyImporter
  def initialize(file = 'test/fixtures/files/Company.xlsx')
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
        okdev = okved_cache[row['Вид деятельности']]
        company = Company.new(prepare_data(row))
        if white_list?(company)
          company.company_okved.build(okved: okdev) if okdev.present?
          @compaies << company
        end
      end
    end

    Company.import @compaies, recursive: true
  end

  private

  def white_list?(company)
    list = [
      /Кирова, д.130/,
      /Елькина, д.65/,
      /Елькина, д.63/,
      /Елькина, д.67/,
      /Елькина, д.75/,
      /Елькина, д.73/,
      /Елькина, д.77/
    ]

    list.any? { |x| company[:address].match?(x) }
  end

  def prepare_data(item)
    {
      name: item['Название'],
      inn: item['ИНН'],
      address: item['Адрес'],
      phone: item['Телефон'],
      email: item['email'],
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
