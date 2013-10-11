require File.expand_path(File.dirname(__FILE__) + '/../lib/newsblurry')

require 'pry'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
end
