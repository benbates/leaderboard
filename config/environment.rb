# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Leaderboard::Application.initialize!

module Callbacks
  def callbacks_for_with_uniq(method)
    callbacks_for_without_uniq(method).uniq
  end

  alias_method_chain :callbacks_for, :uniq
end
