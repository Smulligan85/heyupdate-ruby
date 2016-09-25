Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

class Heyupdate::Client

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
      req.url_prefix = "https://api.heyupdate.com"
      req.adapter :net_http

      req.headers['Content-Type'] = "application/json"
      req.headers['User-Agent'] = "HeyUpdate-Ruby v#{Heyupdate::VERSION}"
      req.headers['Authorization'] = "Bearer #{auth_token}"
    end
  end

end
