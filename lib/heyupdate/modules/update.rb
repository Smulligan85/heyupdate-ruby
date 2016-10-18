require 'pry'
class Heyupdate::Client

  module Update

    def updates
      updates = connection.get("/updates").body
      JSON.parse(updates)
    end
  end
end
