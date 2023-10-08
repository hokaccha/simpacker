require "test_helper"

class HelperTest < ActionView::TestCase
  tests Simpacker::Helper

  def test_javascript_pack_tag
    assert_equal '<script src="/packs/application.js"></script>', javascript_pack_tag('application')
    assert_equal '<script src="/packs/application.js"></script>', javascript_pack_tag(:application)
  end

  def test_stylesheet_pack_tag
    assert_equal '<link rel="stylesheet" href="/packs/application.css" media="screen" />', stylesheet_pack_tag('application')
  end

  def test_image_pack_tag
    assert_equal '<img src="/packs/images/favicon.ico" />', image_pack_tag('favicon.ico')
  end

  def test_image_pack_url
    assert_equal 'http://test.host/packs/images/favicon.ico', image_pack_url('favicon.ico')
  end

  if Rails.gem_version >= Gem::Version.new('7.1.0')
    def test_picture_pack_tag
      assert_equal '<picture><img src="/packs/images/favicon.ico" /></picture>', picture_pack_tag('favicon.ico')
      assert_equal '<picture><img src="/packs/images/favicon.ico" width="20" height="20" /></picture>', picture_pack_tag('favicon.ico', image: { size: "20" })
      assert_equal <<~HTML.gsub(/\n\s*/, ''), picture_pack_tag('favicon.ico', 'sample.png', image: { alt: 'Image' })
        <picture>
          <source srcset="/packs/images/favicon.ico" />
          <source srcset="/packs/images/sample.png" type="image/png" />
          <img alt="Image" src="/packs/images/sample.png" />
        </picture>
      HTML
    end
  end

  def test_favicon_pack_tag
    assert_equal '<link rel="icon" type="image/x-icon" href="/packs/images/favicon.ico" />', favicon_pack_tag('favicon.ico')
  end
end
