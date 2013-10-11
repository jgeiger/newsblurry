require 'httparty'
require 'newsblurry/version'

module Newsblurry
  autoload :Agent, 'newsblurry/agent'
  autoload :Connection, 'newsblurry/connection'
  autoload :Feed, 'newsblurry/feed'
  autoload :FeedParser, 'newsblurry/feed_parser'
  autoload :Story, 'newsblurry/story'
  autoload :StoryParser, 'newsblurry/story_parser'
end
