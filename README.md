# Newsblurry

[![Gem Version](https://badge.fury.io/rb/newsblurry.png)](https://rubygems.org/gems/newsblurry)
[![Dependency Status](https://gemnasium.com/jgeiger/newsblurry.png)](https://gemnasium.com/jgeiger/newsblurry)
[![Build Status](https://travis-ci.org/jgeiger/newsblurry.png)](https://travis-ci.org/jgeiger/newsblurry)
[![Code Climate](https://codeclimate.com/github/jgeiger/newsblurry.png)](https://codeclimate.com/github/jgeiger/newsblurry)

## Description

Connect to Newsblur API using Ruby

## Installation
Add this line to your Gemfile

    gem 'newsblurry'

And then:

    bundle

## Usage

Create a new agent with your username and password.
Use the agent to retrieve your unread stories or mark a story as read.

    agent = Newsblurry::Agent.new(username, password)

### Return all unread stories for account
    unread_stories = agent.unread_stories

`Agent.unread_stories` does not fetch the story content by default but you can override this by setting the `include_story_content` option to `true`.

    unread_stories = agent.unread_stories(include_story_content: true)

### Mark a story as read
    agent.mark_as_read(newsblurry_story_hash)

## License
Released under the MIT License
