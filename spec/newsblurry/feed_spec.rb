require "spec_helper"

describe Newsblurry::Feed do
  before do
    feed_hash = {
      "id" => 1084,
      "feed_link" => "http://www.rubyinside.com",
      "feed_address" => "http://feeds.feedburner.com/RubyInside",
      "feed_title" => "Ruby Inside"
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
