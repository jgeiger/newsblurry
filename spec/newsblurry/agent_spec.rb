require "spec_helper"

describe Newsblurry::Agent do
  before do
    username = "test"
    password = "test"
    @connection = double(:connection)

    expect(Newsblurry::Connection).to receive(:new)
      .and_return(@connection)

    @agent = Newsblurry::Agent.new(username, password)
  end

  context "#initialize" do
    it "creates a Newsblurry::Agent instance" do
      expect(@agent.class).to eq(Newsblurry::Agent)
    end
  end

  context "when accessing the API" do
    context "#unread_stories" do
      it "calls the connection method for unread_stories" do
        expect(@connection).to receive(:unread_stories)

        @agent.unread_stories
      end
    end

    context "#mark_as_read" do
      it "calls the connection method for mark_as_read" do
        story_hash = "1234:abcd"

        expect(@connection).to receive(:mark_as_read)
          .with(story_hash)

        @agent.mark_as_read(story_hash)
      end
    end
  end
end
