module Simpacker
  module Helper
    def javascript_pack_tag(*names, **options)
      sources = names.map do |name|
        Simpacker.manifest.lookup!("#{name}#{compute_asset_extname(name, type: :javascript)}")
      end
      javascript_include_tag(*sources, **options)
    end

    def stylesheet_pack_tag(*names, **options)
      sources = names.map do |name|
        Simpacker.manifest.lookup!("#{name}#{compute_asset_extname(name, type: :stylesheet)}")
      end
      stylesheet_link_tag(*sources, **options)
    end

    def asset_pack_path(name, **options)
      asset_path(Simpacker.manifest.lookup!(name), **options)
    end

    def asset_pack_url(name, **options)
      asset_url(Simpacker.manifest.lookup!(name), **options)
    end

    def image_pack_tag(name, **options)
      image_tag(asset_path(Simpacker.manifest.lookup!(name)), **options)
    end
  end
end
