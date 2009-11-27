require 'test_helper'

class UserRoleTest < ActiveSupport::TestCase

  should_validate_presence_of :name
  should_belong_to :story

end

