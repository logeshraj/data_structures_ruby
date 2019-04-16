require "bundler/setup"

Dir[File.join(File.dirname(File.expand_path(__FILE__)), '..','lib', '/*/*.rb')].each {|file| require file }
# Dir[File.join(File.dirname(File.expand_path(__FILE__)), '..','lib', '*.rb')].each {|file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end