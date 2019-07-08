require "test_helper"
require "tempfile"

class ManifestTest < Minitest::Test
  def setup
    manifest_json = {
      "app.js": "app-xxx.js",
      "a": {
        "b": {
          "c": "d"
        }
      }
    }.to_json
    @manifest_file = Tempfile.new("manifest.json")
    @manifest_file.write manifest_json
    @manifest_file.rewind
    config = Simpacker::Configuration.new(manifest_path: Pathname.new(@manifest_file.path))
    @manifest = Simpacker::Manifest.new(config)
  end

  def teardown
    @manifest_file.close
  end

  def test_lookup
    assert_equal 'app-xxx.js', @manifest.lookup('app.js')
  end

  def test_lookup_nil
    assert_nil @manifest.lookup('foo.js')
  end

  def test_lookup_nested
    assert_equal 'd', @manifest.lookup('a', 'b', :c)
  end

  def test_lookup_nested_nil
    assert_nil @manifest.lookup('a', 'x', :c)
  end

  def test_missing_entry_error
    assert_raises Simpacker::Manifest::MissingEntryError do
      assert_nil @manifest.lookup!('x')
    end
  end

  def test_missing_manifest_file_error
    assert_raises Simpacker::Manifest::MissingFileError do
      config = Simpacker::Configuration.new(manifest_path: Pathname.new('./manifest.json'))
      manifest = Simpacker::Manifest.new(config)
      manifest.lookup('foo')
    end
  end
end
