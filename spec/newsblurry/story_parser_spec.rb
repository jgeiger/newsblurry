require 'spec_helper'

describe Newsblurry::StoryParser do
  before do
    story_hashes = [
      {
        "story_authors"=>"Jerod Santo",
        "intelligence"=>{
          "feed"=>0,
          "tags"=>0,
          "author"=>0,
          "title"=>0
        },
        "story_permalink"=>"http://feedproxy.google.com/~r/thechangelog/~3/3Hgy1mKZWsg/",
        "reply_count"=>0,
        "comment_user_ids"=>[],
        "story_timestamp"=>"1381180513",
        "share_user_ids"=>[],
        "story_hash"=>"1641:aaae79",
        "id"=>"http://thechangelog.com/?p=6697",
        "comment_count"=>nil,
        "story_tags"=>[
          "links",
          "activerecord",
          "postgresql",
          "rails",
          "ruby"
        ],
        "share_count"=>nil,
        "friend_comments"=>[],
        "story_date"=>"2013-10-07 21:15:13",
        "short_parsed_date"=>"07 Oct 2013, 4:15pm",
        "guid_hash"=>"aaae79",
        "image_urls"=>[
          "http://feeds.feedburner.com/~ff/thechangelog?d=yIl2AUoC8zA",
          "http://feeds.feedburner.com/~ff/thechangelog?d=7Q72WNTAKBA",
          "http://feeds.feedburner.com/~ff/thechangelog?i=3Hgy1mKZWsg:sXiRXBXQvaQ:V_sGLiPBpWU",
          "http://feeds.feedburner.com/~ff/thechangelog?d=qj6IDK7rITs",
          "http://feeds.feedburner.com/~ff/thechangelog?i=3Hgy1mKZWsg:sXiRXBXQvaQ:gIN9vFwOqvQ",
          "http://feeds.feedburner.com/~r/thechangelog/~4/3Hgy1mKZWsg"],
          "story_feed_id"=>1641,
          "long_parsed_date"=>"Monday, October 7th, 2013 4:15pm",
          "public_comments"=>[],
          "read_status"=>0,
          "story_title"=>"Use Rails with the db schema you always wanted"
      }
    ]
    @story_parser = Newsblurry::StoryParser.new(story_hashes)
  end

  it "returns the stories in an array" do
    parsed_story_title_array = ["Use Rails with the db schema you always wanted"]
    titles = @story_parser.stories.map(&:title)
    expect(titles).to match_array(parsed_story_title_array)
  end
end
