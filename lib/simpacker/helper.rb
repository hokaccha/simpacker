module Simpacker
  module Helper
    def javascript_pack_tag(*names, **options)
      sources = names.map do |name|
        simpacker_context.manifest.lookup!("#{name}#{compute_asset_extname(name.to_s, type: :javascript)}")
      end
      javascript_include_tag(*sources, **options)
    end

    def stylesheet_pack_tag(*names, **options)
      sources = names.map do |name|
        simpacker_context.manifest.lookup!("#{name}#{compute_asset_extname(name.to_s, type: :stylesheet)}")
      end
      stylesheet_link_tag(*sources, **options)
    end

    def asset_pack_path(name, **options)
      asset_path(simpacker_context.manifest.lookup!(name), **options)
    end

    def asset_pack_url(name, **options)
      asset_url(simpacker_context.manifest.lookup!(name), **options)
    end

    def image_pack_tag(name, **options)
      image_tag(asset_path(simpacker_context.manifest.lookup!(name)), **options)
    end

    def image_pack_url(name, **options)
      asset_url(simpacker_context.manifest.lookup!(name), **options)
    end

    def picture_pack_tag(*names, &block)
      unless Rails.gem_version >= Gem::Version.new('7.1.0')
        raise NotImplementedError, '`picture_pack_tag` is only available for Rails 7.1 or above.'
      end
      names.flatten!
      options = names.extract_options!
      sources = names.map { |name| asset_path(simpacker_context.manifest.lookup!(name)) }
      picture_tag(*sources, options, &block)
    end

    def favicon_pack_tag(name, **options)
      favicon_link_tag(asset_path(simpacker_context.manifest.lookup!(name)), **options)
    end

    def simpacker_context
      Simpacker.default_context
    end
  end
end
