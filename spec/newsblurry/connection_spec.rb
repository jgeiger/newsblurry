require 'spec_helper'

describe Newsblurry::Connection do
  context "#initialize" do
    it "logs the user in" do
      username = "test"
      password = "test"

      stub_request(:post, "https://www.newsblur.com/api/login").with(
        body: "password=test&username=test",
        headers: {'Cookie'=>'', 'User-Agent'=>'Newsblurry::Connection - 0.0.1'}
      )

      connection = Newsblurry::Connection.new(username, password)
      expect(connection.class).to eq(Newsblurry::Connection)
    end
  end

  context "when accessing the API" do
    before do
      stub_request(:post, "https://www.newsblur.com/api/login")
      @connection = Newsblurry::Connection.new("test", "test")
    end

    context "#feeds" do
      it "returns an array of Newsblurry::Feed" do
        raw_response_file = File.new("spec/fixtures/feeds.txt")
        stub_request(:get, "https://www.newsblur.com/reader/feeds").
          to_return(raw_response_file)
        feeds = @connection.feeds

        expect(feeds.size).to eq(3)
        titles = ["Ruby Inside", "The Changelog", "Pivotal Labs"]
        expect(feeds.map(&:title)).to match_array(titles)
      end
    end

    context "#feed" do
      it "returns an array of Newsblurry::Story" do
        raw_response_file = File.new("spec/fixtures/feed_1641.txt")
        stub_request(:get, "https://www.newsblur.com/reader/feed/1641?include_story_content=false&read_filter=unread").
          to_return(raw_response_file)

        stories = @connection.feed(1641)

        titles = ["Use Rails with the db schema you always wanted"]
        expect(stories.map(&:title)).to match_array(titles)
      end
    end

    context "#unread_feed_story_hashes" do
      it "returns an array of unread Newsblurry::Story" do
        raw_response_file = File.new("spec/fixtures/unread_feed_story_hashes.txt")
        stub_request(:get, "https://www.newsblur.com/reader/unread_story_hashes").
          to_return(raw_response_file)

        unread_feed_story_hashes = @connection.unread_feed_story_hashes

        expect(unread_feed_story_hashes.keys).to include("1641")
        expect(unread_feed_story_hashes.values.flatten).to include("1641:cb0caf")
      end
    end

    context "#unread_stories" do
      it "returns an array of unread Newsblurry::Story" do
        story_hashes_file = File.new("spec/fixtures/unread_feed_story_hashes.txt")
        stub_request(:get, "https://www.newsblur.com/reader/unread_story_hashes").
          to_return(story_hashes_file)

        feed_file = File.new("spec/fixtures/feed_1641.txt")
        stub_request(:get, "https://www.newsblur.com/reader/feed/1641?include_story_content=false&read_filter=unread").
          to_return(feed_file)

        unread_stories = @connection.unread_stories

        titles = ["Use Rails with the db schema you always wanted"]
        expect(unread_stories.map(&:title)).to match_array(titles)
      end
    end

    context "#mark_as_read" do
      it "marks the Newsblurry::Story as read" do
        raw_response_file = File.new("spec/fixtures/mark_as_read_1095_cdeec3.txt")
        stub_request(:post, "https://www.newsblur.com/reader/mark_story_hashes_as_read").
          with(:body => "story_hash=1095%3Acdeec3").
          to_return(raw_response_file)

        story_hash_string = "1095:cdeec3"
        response = @connection.mark_as_read(story_hash_string)

        expect(response['feed_ids']).to eq(["1095"])
      end
    end
  end
end
