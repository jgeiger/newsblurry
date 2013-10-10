module Newsblurry
  class FeedParser

    def initialize(feeds_hash)
      @feeds = []
      @feeds_hash = feeds_hash
      parse_feeds
    end

    def feeds
      @feeds
    end

    private

    def parse_feeds
      @feeds = @feeds_hash.values.map do |value|
        Newsblurry::Feed.new(value)
      end
    end
  end
end
