module Newsblurry
  class Feed
    attr_reader :id, :title, :link, :address

    def initialize(feed_hash)
      @id = feed_hash["id"]
      @title = feed_hash["feed_title"]
      @link = feed_hash["feed_link"]
      @address = feed_hash["feed_address"]
    end
  end
end
