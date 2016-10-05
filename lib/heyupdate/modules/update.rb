class Heyupdate::Client

  module Update

    def updates
      updates = connection.get("/updates").body
      JSON.parse(updates)
    end

    def post_update(message, option={})
      !options[:user].nil? ? url = "/updates/#{options[:user]}" : url = "/updates"
      update = connection.post(url) do |req|
        req.headers['Content-Length'] = message.length
        req.params['message'] = message
        req.params['timestamp'] = options[:timestamp] unless options[:timestamp].nil?
      end
      JSON.parse(update.body)
    end

  end
end
