module Newsblurry
  class Connection
    include HTTParty
    base_uri 'https://www.newsblur.com'
    disable_rails_query_string_format

    debug_output

    def initialize(username, password)
      options = { body: { username: username, password: password } }
      response = post_request('/api/login', options)
      @cookie = response.headers['set-cookie']
    end

    def feeds
      response = get_request('/reader/feeds')
      FeedParser.new(response['feeds']).feeds
    end

    def feed(feed_id)
      options = { query: { read_filter: 'unread', include_story_content: false } }
      response = get_request("/reader/feed/#{feed_id}", options)
      StoryParser.new(response['stories']).stories
    end

    def unread_feed_story_hashes
      response = get_request('/reader/unread_story_hashes')
      response['unread_feed_story_hashes']
    end

    def unread_stories
      unread_feed_story_hashes.keys.flat_map do |feed_id|
        feed(feed_id)
      end
    end

    def mark_as_read(story_hash)
      options = { body: {story_hash: story_hash }}
      post_request('/reader/mark_story_hashes_as_read', options)
    end

    private

    def get_request(url, options={})
      options.merge!(headers)
      self.class.get(url, options)
    end

    def post_request(url, options={})
      options.merge!(headers)
      self.class.post(url, options)
    end

    def headers
      { headers: {
        'User-Agent' => "#{self.class.name} - #{Newsblurry::VERSION}",
        'Cookie' => @cookie || "" }
      }
    end
  end
end
