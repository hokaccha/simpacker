require "test_helper"

class HelperTest < ActionView::TestCase
  tests Simpacker::Helper

  def test_javascript_pack_tag
    assert_equal '<script src="/packs/application.js"></script>', javascript_pack_tag('application')
    assert_equal '<script src="/packs/application.js"></script>', javascript_pack_tag(:application)
  end
end
