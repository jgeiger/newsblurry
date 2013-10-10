require 'spec_helper'

describe Newsblurry::Story do
  before do
    story_hash = {
      "story_authors"=>"",
      "intelligence"=>
      {
        "feed"=>0,
        "tags"=>0,
        "author"=>0,
        "title"=>0
      },
      "story_permalink"=>"http://feeds.boston.com/c/35022/f/646883/s/322bb1b1/sc/10/l/0L0Sboston0N0Cbigpicture0C20A130C10A0Cbroken0Ilives0Iof0Ifukushima0Bhtml/story01.htm",
      "reply_count"=>0,
      "comment_user_ids"=>[],
      "story_timestamp"=>"1381190056",
      "share_user_ids"=>[],
      "story_hash"=>"1095:67324d",
      "id"=>"http://www.boston.com/bigpicture/2013/10/broken_lives_of_fukushima.html",
      "comment_count"=>nil,
      "story_tags"=>[],
      "share_count"=>nil,
      "friend_comments"=>[],
      "story_date"=>"2013-10-07 23:54:16",
      "short_parsed_date"=>"07 Oct 2013, 6:54pm",
      "guid_hash"=>"67324d",
      "image_urls"=>[
        "http://inapcache.boston.com/universal/site_graphics/blogs/bigpicture/japan_nuclear_2013/bp1.jpg",
        "http://feeds.boston.com/c/35022/f/646883/s/322bb1b1/sc/10/mf.gif",
        "http://res3.feedsportal.com/social/twitter.png",
        "http://res3.feedsportal.com/social/facebook.png",
        "http://res3.feedsportal.com/social/linkedin.png",
        "http://res3.feedsportal.com/social/googleplus.png",
        "http://res3.feedsportal.com/social/email.png",
        "http://da.feedsportal.com/r/176965384125/u/0/f/646883/c/35022/s/322bb1b1/sc/10/rc/1/rc.img",
        "http://da.feedsportal.com/r/176965384125/u/0/f/646883/c/35022/s/322bb1b1/sc/10/rc/2/rc.img",
        "http://da.feedsportal.com/r/176965384125/u/0/f/646883/c/35022/s/322bb1b1/sc/10/rc/3/rc.img",
        "http://da.feedsportal.com/r/176965384125/u/0/f/646883/c/35022/s/322bb1b1/a2.img",
        "http://pi.feedsportal.com/r/176965384125/u/0/f/646883/c/35022/s/322bb1b1/a2t.img"
      ],
      "story_feed_id"=>1095,
      "long_parsed_date"=>"Yesterday, October 7th 6:54pm",
      "public_comments"=>[],
      "read_status"=>0,
      "story_title"=>"Broken lives of Fukushima"
    }
    @story = Newsblurry::Story.new(story_hash)
  end

  it "sets the link" do
    link = "http://feeds.boston.com/c/35022/f/646883/s/322bb1b1/sc/10/l/0L0Sboston0N0Cbigpicture0C20A130C10A0Cbroken0Ilives0Iof0Ifukushima0Bhtml/story01.htm"
    expect(@story.link).to eq(link)
  end

  it "sets the title" do
    title = "Broken lives of Fukushima"
    expect(@story.title).to eq(title)
  end

  it "sets the hash" do
    hash = "1095:67324d"
    expect(@story.hash).to eq(hash)
  end

  it "sets the published_at" do
    published_at = "2013-10-07 23:54:16"
    expect(@story.published_at).to eq(DateTime.parse(published_at))
  end
end
