class LocationImporter
  attr_accessor :compaies, :hydra, :api_key

  def initialize()
    @hydra = Typhoeus::Hydra.new(max_concurrency: 10)
    @compaies = Company.where.not(longitude: :nil).or(Company.where.not(latitude: :nil)).limit(100)

    # to env
    @api_key = '9f800cdd-d032-497d-b5cb-2cb9a4348392'
  end

  def execute
    compaies.each do |company|
      request = Typhoeus::Request.new(request_url(company.address), followlocation: true)

      request.on_complete do |response|
        if response.success?
          parsed_data = parse_response(response.body)
          Rails.logger.info "[response] #{parsed_data}"

          if parsed_data.present?
            location = find_location(parsed_data)
             Rails.logger.warn "[ok] #{company.address}"
             Rails.logger.warn "[ok] #{location}"

            company.longitude = location[:longitude]
            company.latitude = location[:latitude]
            company.save!

            Rails.logger.warn "[ok] #{company.inspect}"
          else
            Rails.logger.warn "[fail] #{company.address}"
          end

        elsif response.timed_out?
          Rails.logger.warn "Timeout #{company.address}"
        else
          Rails.logger.warn "Request failed #{company.address}"
        end
      end

      request.on_failure do |response|
        Rails.logger.warn "[critical] failed #{company.address}, code: #{response.code}, message: #{response.return_message}"
      end

      hydra.queue(request)
    end

    hydra.run
  end

  def request_url(address)
    geocoder_url = 'https://geocode-maps.yandex.ru/1.x'
    query = {
      geocode: address,
      format:  'json',
      apikey: api_key,
      lang:    'ru',
      results: '1',
    }

    [geocoder_url, query.to_query].join('/?')
  end

  def parse_response(response_body)
    Oj.load(response_body)
  rescue Oj::ParseError => e
    Rails.logger.warn e.message
    Rails.logger.warn "Invalid body: #{response_body.inspect}"
    {}
  end

  # первый из выдачи
  def find_location(parsed_data)
    geo_object = parsed_data.dig('response', 'GeoObjectCollection', 'featureMember').first['GeoObject']

    coords = {}
    coords[:longitude], coords[:latitude] = geo_object['Point']['pos'].split(' ')

    coords
  end
end
