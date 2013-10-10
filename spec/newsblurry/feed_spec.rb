require 'spec_helper'

describe Newsblurry::Feed do
  before do
    feed_hash = {
      "subs"=>1357,
      "favicon_url"=>"http://icons.newsblur.com/1084.png",
      "is_push"=>true,
      "feed_opens"=>8,
      "id"=>1084,
      "ps"=>0,
      "feed_link"=>"http://www.rubyinside.com",
      "updated_seconds_ago"=>31493,
      "favicon_fetching"=>false,
      "ng"=>0,
      "favicon_border"=>"a97175",
      "nt"=>0,
      "not_yet_fetched"=>false,
      "updated"=>"8 hours",
      "s3_icon"=>true,
      "feed_address"=>"http://feeds.feedburner.com/RubyInside",
      "feed_title"=>"Ruby Inside",
      "favicon_fade"=>"ffbac0",
      "favicon_color"=>"e2979d",
      "active"=>true,
      "fetched_once"=>true,
      "favicon_text_color"=>"white",
      "subscribed"=>true,
      "num_subscribers"=>1357,
      "s3_page"=>false,
      "min_to_decay"=>696
    }
    @feed = Newsblurry::Feed.new(feed_hash)
  end

  it "sets the id" do
    id = 1084
    expect(@feed.id).to eq(id)
  end

  it "sets the link" do
    link = "http://www.rubyinside.com"
    expect(@feed.link).to eq(link)
  end

  it "sets the title" do
    title = "Ruby Inside"
    expect(@feed.title).to eq(title)
  end

  it "sets the address" do
    address = "http://feeds.feedburner.com/RubyInside"
    expect(@feed.address).to eq(address)
  end
end
