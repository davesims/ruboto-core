require File.expand_path("test_helper", File.dirname(__FILE__))
require 'fileutils'
require 'test/app_test_methods'

class RubotoGenTest < Test::Unit::TestCase
  include AppTestMethods

  def setup
    generate_app
  end

  def teardown
    cleanup_app
  end

  def test_icons_are_updated
    Dir.chdir APP_DIR do
      assert_equal 4032, File.size('res/drawable-hdpi/icon.png')
    end
  end

end

if not RubotoTest::ON_JRUBY_JARS_1_5_6
  class RubotoGenWithPsychTest < RubotoGenTest
    def setup
      generate_app :with_psych => true
    end

    def test_psych_jar_exists
      assert File.exists?("#{APP_DIR}/libs/psych.jar"), "Failed to generate psych jar"
    end

  end
else
  puts "Skipping Psych tests on jruby-jars-1.5.6"
end
