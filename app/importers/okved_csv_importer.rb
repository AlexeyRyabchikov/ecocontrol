require 'csv'

class OkvedCsvImporter
  attr_accessor :file_path, :okveds

  def initialize(file = 'test/fixtures/files/okved.csv')
    @file_path = file
    @options = {
      headers: false,
      col_sep: ';'
    }
    @okveds = []
  end

  def execute
    CSV.read(file_path, @options).each do |row|
      okved = prepare_row(row)
      okveds << okved if okved[:code].present?
    end

    Okved.insert_all(okveds, unique_by: :code)
  end

  private

  def prepare_row(row)
    {
      section: prepare_col(row[0]),
      code: prepare_col(row[1]),
      name: prepare_col(row[2]),
      updated_at: DateTime.now,
      created_at: DateTime.now
    }
  end

  def prepare_col(col)
    col.to_s.strip
  end
end
