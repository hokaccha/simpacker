require "test_helper"

class ManifestTest < Minitest::Test
  def test_invalid_configuration_error
    assert_raises Simpacker::Context::InvalidConfigurationError do
      Simpacker::Context.new(root_path: Pathname.new('.'), env: :test)
    end
  end
end
