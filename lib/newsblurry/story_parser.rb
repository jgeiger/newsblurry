module Newsblurry
  class StoryParser

    def initialize(story_hashes)
      @stories = []
      @story_hashes = story_hashes
      parse_stories
    end

    def stories
      @stories
    end

    private

    def parse_stories
      @stories = @story_hashes.map do |story_hash|
        Newsblurry::Story.new(story_hash)
      end
    end
  end
end
