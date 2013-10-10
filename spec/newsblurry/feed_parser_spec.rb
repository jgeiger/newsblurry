require 'spec_helper'

describe Newsblurry::FeedParser do
  before do
    @ruby_feed_hash = {
      "id"=>1084,
      "feed_link"=>"http://www.rubyinside.com",
      "feed_address"=>"http://feeds.feedburner.com/RubyInside",
      "feed_title"=>"Ruby Inside"
    }
    @pivotal_feed_hash = {
      "id"=>588670,
      "feed_link"=>"http://pivotallabs.com",
      "feed_address"=>"http://pivotallabs.com/feed/",
      "feed_title"=>"Pivotal Labs"
    }
    @changelog_feed_hash = {
      "id"=>1641,
      "feed_link"=>"http://thechangelog.com",
      "feed_address"=>"http://feeds.feedburner.com/thechangelog",
      "feed_title"=>"The Changelog",
    }
    feeds_hash = {
      "1084"=> @ruby_feed_hash,
      "588670"=> @pivotal_feed_hash,
      "1641"=> @changelog_feed_hash
    }
    @feed_parser = Newsblurry::FeedParser.new(feeds_hash)
  end

  it "returns the feeds in an array" do
    ruby_feed = Newsblurry::Feed.new(@ruby_feed_hash)
    pivotal_feed = Newsblurry::Feed.new(@pivotal_feed_hash)
    changelog_feed = Newsblurry::Feed.new(@changelog_feed_hash)
    parsed_feed_title_array = [changelog_feed.title,
                               pivotal_feed.title,
                               ruby_feed.title]
    titles = @feed_parser.feeds.map(&:title)
    expect(titles).to match_array(parsed_feed_title_array)
  end
end
