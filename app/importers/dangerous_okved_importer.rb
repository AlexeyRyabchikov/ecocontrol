require 'csv'

class DangerousOkvedImporter
  def initialize(file = 'test/fixtures/files/pto_ovn.csv')
    @file_path = file
    @options = {
      headers: true,
      col_sep: ';'
    }
    @okveds = {}
  end

  def execute
    # окведы по частоте упоминания
    CSV.read(@file_path, @options).each do |row|
      row["ОКВЭД"].to_s.split(',').each do |okved|
        code = okved.strip
        @okveds[code] ||= 0
        @okveds[code] += 1
      end
    end

    # но не пригодилось =/
    Okved.where(code: @okveds.keys).update_all(dangerous: true)
  end
end
