module ApplicationHelper
  def javascript_packs_with_chunks_tag(*names, **options)
    paths = names.flat_map{|name| simpacker_context.manifest.lookup!("entrypoints", name, "js") }.uniq
    javascript_include_tag(*paths, **options)
  end
end
