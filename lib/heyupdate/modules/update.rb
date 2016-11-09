class Heyupdate::Client

  module Update

    def updates
      updates = connection.get("/updates")
      parse_response(updates)
    end

    def post_update(message, options={})
      !options[:user].nil? ? url = "/updates/#{options[:user]}" : url = "/updates"
      update = connection.post(url) do |req|
        req.body = "{\"message\": \"#{message}\"}"
        req.params['timestamp'] = options[:timestamp] unless options[:timestamp].nil?
      end
      parse_response(update)
    end

    def edit_update(update_id, message=nil, timestamp=nil)
      update = connection.patch("/updates/#{update_id}") do |req|
        req.body = "{\"message\": \"#{message}\"}"
        req.params['timestamp'] = timestamp unless timestamp.nil?
      end
      parse_response(update)
    end

  end
end
