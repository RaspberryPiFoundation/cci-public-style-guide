require 'test_helper'
require 'generators/component/component_generator'

class ComponentGeneratorTest < Rails::Generators::TestCase
  tests ComponentGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
