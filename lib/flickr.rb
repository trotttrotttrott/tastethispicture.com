require "faraday"

class Flickr
  class << self

    EXTRAS = "description, license, date_upload, date_taken, owner_name, icon_server, original_format, last_update, geo, tags, machine_tags, o_dims, views, media, path_alias, url_sq, url_t, url_s, url_q, url_m, url_n, url_z, url_c, url_l, url_o"

    def get_stream(page)
      conn.get "", :method => "flickr.people.getPhotos",
                   :page => page,
                   :per_page => 25,
                   :api_key => ENV["FLICKR_KEY"],
                   :user_id => ENV["FLICKR_USER_ID"],
                   :format => "json",
                   :nojsoncallback => 1,
                   :extras => EXTRAS
    end

    private

    def conn
      @@con ||= Faraday.new(:url => "http://api.flickr.com/services/rest") do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end
  end
end
