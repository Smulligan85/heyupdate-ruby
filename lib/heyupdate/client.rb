Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

class Heyupdate::Client
  include Update

  attr_reader :auth_token

  def initialize(auth_token=nil)
    @auth_token = auth_token
  end

  def auth_token=(new_token)
    @auth_token = new_token
    reset_connection
  end

  def reset_connection
    @connection = nil
  end

  def connection
   @connection ||= Faraday.new do |req|
      req.adapter :net_http
      req.url_prefix = "https://api.heyupdate.com"

      req.headers['Content-Type'] = "application/json"
      req.headers['User-Agent'] = "HeyUpdate-Ruby v#{Heyupdate::VERSION}"
      req.headers['Accept'] = "*/*"
      req.headers['Authorization'] = "Bearer #{auth_token}"
      req.response :json, content_type: /\bjson$/
    end
  end

  def parse_response(response)
    responses = [200, 201, 400, 401, 403, 404, 406, 409, 429, 500, 502, 503]
    responses.include?(response.status) ? response.body : "Unexpected Error from heyupdate-ruby"
  end

end
