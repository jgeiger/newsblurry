module Newsblurry
  class Story

    attr_reader :title, :link, :hash, :published_at

    def initialize(story_hash)
      @title = story_hash['story_title']
      @link = story_hash['story_permalink']
      @hash = story_hash['story_hash']
      @published_at = DateTime.parse(story_hash['story_date'])
    end
  end
end
