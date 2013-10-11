require 'spec_helper'

describe Newsblurry::Story do
  before do
    story_hash = {
      'story_title' => 'Broken lives of Fukushima',
      'story_permalink' => 'http://feeds.boston.com/c/35022/story01.htm',
      'story_hash' => '1095:67324d',
      'story_date' => '2013-10-07 23:54:16'
    }

    feed_hash = {
      'id' => 1095,
      'feed_link' => 'http://boston.com',
      'feed_address' => 'http://feeds.boston.com',
      'feed_title' => 'The Big Picture'
    }

    feed = Newsblurry::Feed.new(feed_hash)
    @story = Newsblurry::Story.new(feed, story_hash)
  end

  it 'sets the link' do
    link = 'http://feeds.boston.com/c/35022/story01.htm'
    expect(@story.link).to eq(link)
  end

  it 'returns the title' do
    title = 'Broken lives of Fukushima'
    expect(@story.title).to eq(title)
  end

  it 'returns the hash' do
    hash = '1095:67324d'
    expect(@story.hash).to eq(hash)
  end

  it 'returns the published_at' do
    published_at = '2013-10-07 23:54:16'
    expect(@story.published_at).to eq(DateTime.parse(published_at))
  end

  it 'returns the feed_title' do
    feed_title = 'The Big Picture'
    expect(@story.feed_title).to eq(feed_title)
  end

  it 'returns the feed_link' do
    feed_link = 'http://boston.com'
    expect(@story.feed_link).to eq(feed_link)
  end

  it 'returns the feed_address' do
    feed_address = 'http://feeds.boston.com'
    expect(@story.feed_address).to eq(feed_address)
  end
end
