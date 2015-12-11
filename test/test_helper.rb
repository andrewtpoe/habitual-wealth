ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include Devise::TestHelpers

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  Rails.logger.level = 10

  def valid_user_object(object, current_user = nil)
    valid = true
    valid = false unless object[:id] && object[:id].class == Fixnum
    valid = false unless user = User.find_by(id: object[:id])
    valid = false unless object[:email] && user.email == object[:email]
    if current_user
      valid = false unless user.id == current_user.id
      valid = false unless user.email == current_user.email
    end
    return valid
  end

end
