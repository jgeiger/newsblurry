require "spec_helper"

describe Newsblurry::StoryParser do
  before do
    story_hashes = [
      {
        "story_permalink" => "http://feedproxy.google.com/~r/thechangelog/",
        "story_hash" => "1641:aaae79",
        "id" => "http://thechangelog.com/?p=6697",
        "story_date" => "2013-10-07 21:15:13",
        "story_feed_id" => 1641,
        "story_title" => "Use Rails with the db schema you always wanted"
      }
    ]
    feed_hash = {
      "id" => 1641,
      "feed_link" => "http://www.thechangelog.com",
      "feed_address" => "http://feeds.thechangelog.com",
      "feed_title" => "The Changelog"
    }
    feed = Newsblurry::Feed.new(feed_hash)
    @story_parser = Newsblurry::StoryParser.new(feed, story_hashes)
  end

  it "returns the stories in an array" do
    parsed_title_array = ["Use Rails with the db schema you always wanted"]
    titles = @story_parser.stories.map(&:title)
    expect(titles).to match_array(parsed_title_array)
  end
end
