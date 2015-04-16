module Newsblurry
  class StoryParser
    attr_reader :stories

    def initialize(feed, story_hashes)
      @stories = []
      @feed = feed
      @story_hashes = story_hashes
      parse_stories
    end

    private

    def parse_stories
      @stories = @story_hashes.map do |story_hash|
        Newsblurry::Story.new(@feed, story_hash)
      end
    end
  end
end
