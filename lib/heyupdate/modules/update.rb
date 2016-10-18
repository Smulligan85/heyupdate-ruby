class Heyupdate::Client

  module Update

    def updates
      updates = connection.get("/updates").body
      JSON.parse(updates)
    end

    def post_update(message, options={})
      !options[:user].nil? ? url = "/updates/#{options[:user]}" : url = "/updates"
      update = connection.post(url) do |req|
        req.body = "{\"message\": \"#{message}\"}"
        req.params['timestamp'] = options[:timestamp] unless options[:timestamp].nil?
      end
      JSON.parse(update.body)
    end

    def edit_update(update_id, message=nil, timestamp=nil)
      update = connection.patch("/updates/#{update_id}") do |req|
        req.body = "{\"message\": \"#{message}\"}"
        req.params['timestamp'] = timestamp unless timestamp.nil?
      end
      JSON.parse(update.body)
    end

  end
end
