require 'test/unit'
require File.expand_path("#{__FILE__}/../../lib/faker-ja")

class MyTest < Test::Unit::TestCase

  def setup
    Faker::Config.locale = "ja"
  end

  def test_first_name
    assert_match /^\S+$/, Faker::Name.first_name
  end

  def test_first_name_yomi
    assert_match /^\S+$/, Faker::Name.first_name.yomi
  end

  def test_last_name
    assert_match /^\S+$/, Faker::Name.last_name
  end

  def test_last_name_yomi
    assert_match /^\S+$/, Faker::Name.last_name.yomi
  end

  def test_name
    assert_match /^\S+ \S+$/, Faker::Name.name
  end

  def test_name_yomi
    assert_match /^\S+ \S+$/, Faker::Name.name.yomi
  end
end