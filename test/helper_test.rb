require "test_helper"

class HelperTest < ActionView::TestCase
  tests Simpacker::Helper

  def test_javascript_pack_tag
    assert_equal '<script src="/packs/application.js"></script>', javascript_pack_tag('application')
    assert_equal '<script src="/packs/application.js"></script>', javascript_pack_tag(:application)
  end

  def test_stylesheet_pack_tag
    assert_equal '<link rel="stylesheet" media="screen" href="/packs/application.css" />', stylesheet_pack_tag('application')
  end

  def test_image_pack_tag
    assert_equal '<img src="/packs/images/favicon.ico" />', image_pack_tag('favicon.ico')
  end

  def test_image_pack_url
    assert_equal '/packs/images/favicon.ico', image_pack_url('favicon.ico')
  end

  def test_favicon_pack_tag
    assert_equal '<link rel="shortcut icon" type="image/x-icon" href="/packs/images/favicon.ico" />', favicon_pack_tag('favicon.ico')
  end
end
