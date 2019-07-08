# Simpacker custom helepr example

If you are using new webpack4 split chunks and webpack-assets-manifest entrypoints, then webpack outputs the following `manifest.json`:

```json
{
  "entrypoints": {
    "map": {
      "js": [
        "/packs/runtime~map-7050b45f89e39073dd17.js",
        "/packs/vendor-7050b45f89e39073dd17.js",
        "/packs/map-7050b45f89e39073dd17.js"
      ]
    },
    "calendar": {
      "js": [
        "/packs/runtime~calendar-7050b45f89e39073dd17.js",
        "/packs/vendor-7050b45f89e39073dd17.js",
        "/packs/calendar-7050b45f89e39073dd17.js"
      ]
    }
  },
  "calendar.js": "/packs/calendar-7050b45f89e39073dd17.js",
  "runtime~calendar.js": "/packs/runtime~calendar-7050b45f89e39073dd17.js",
  "map.js": "/packs/map-7050b45f89e39073dd17.js",
  "runtime~map.js": "/packs/runtime~map-7050b45f89e39073dd17.js",
  "vendor.js": "/packs/vendor-7050b45f89e39073dd17.js"
}
```

In webpacker, you can use `javascript_packs_with_chunks_tag` to read the `entrypoints` value. Simpacker does not provide such a helper, so you need to define the helper yourself. You can use `simpacker_context.manifest.lookup!` to access the `manifest.json` in your helper modules.

```ruby
module ApplicationHelper
  def javascript_packs_with_chunks_tag(*names, **options)
    paths = names.flat_map{|name| simpacker_context.manifest.lookup!("entrypoints", name, "js") }.uniq
    javascript_include_tag(*paths, **options)
  end
end
```

```erb
<%= javascript_packs_with_chunks_tag 'calendar', 'map' %>

<script src="/packs/runtime~calendar-275c176513bc321d9797.js"></script>
<script src="/packs/vendor-275c176513bc321d9797.js"></script>
<script src="/packs/calendar-275c176513bc321d9797.js"></script>
<script src="/packs/runtime~map-275c176513bc321d9797.js"></script>
<script src="/packs/map-275c176513bc321d9797.js"></script>
```
