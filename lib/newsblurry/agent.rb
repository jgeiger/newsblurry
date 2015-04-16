module Newsblurry
  class Agent

    def initialize(username, password)
      @connection = Newsblurry::Connection.new(username, password)
    end

    def unread_stories(include_story_content = false)
      @connection.unread_stories(include_story_content)
    end

    def mark_as_read(story_hash)
      @connection.mark_as_read(story_hash)
    end
  end
end
