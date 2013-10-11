module Newsblurry
  class Story

    attr_reader :title, :link, :hash, :published_at,
                :feed_title, :feed_link, :feed_address

    def initialize(feed, story_hash)
      @title = story_hash['story_title']
      @link = story_hash['story_permalink']
      @hash = story_hash['story_hash']
      @published_at = DateTime.parse(story_hash['story_date'])
      @feed_title = feed.title
      @feed_link = feed.link
      @feed_address = feed.address
    end
  end
end
