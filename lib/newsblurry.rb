require 'httparty'
require 'newsblurry/version'

module Newsblurry
  autoload :Connection, 'newsblurry/connection'
  autoload :Feed, 'newsblurry/feed'
  autoload :Story, 'newsblurry/story'
  autoload :FeedParser, 'newsblurry/feed_parser'
  autoload :StoryParser, 'newsblurry/story_parser'
end
