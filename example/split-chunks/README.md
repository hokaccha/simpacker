# Simpacker split chunks example

If you are using webpack split chunks and webpack-assets-manifest entrypoints, then webpack outputs the following `manifest.json`:

```json
{
  "entrypoints": {
    "map": {
      "assets": {
        "js": [
          "/packs/runtime~map-302963ad04fc6a7b892b.js",
          "/packs/vendor-302963ad04fc6a7b892b.js",
          "/packs/map-302963ad04fc6a7b892b.js"
        ]
      }
    },
    "calendar": {
      "assets": {
        "js": [
          "/packs/runtime~calendar-302963ad04fc6a7b892b.js",
          "/packs/vendor-302963ad04fc6a7b892b.js",
          "/packs/calendar-302963ad04fc6a7b892b.js"
        ]
      }
    }
  },
  "calendar.js": "/packs/calendar-302963ad04fc6a7b892b.js",
  "map.js": "/packs/map-302963ad04fc6a7b892b.js",
  "runtime~calendar.js": "/packs/runtime~calendar-302963ad04fc6a7b892b.js",
  "runtime~map.js": "/packs/runtime~map-302963ad04fc6a7b892b.js",
  "vendor.js": "/packs/vendor-302963ad04fc6a7b892b.js"
}
```

In webpacker, you can use `javascript_packs_with_chunks_tag` to read the `entrypoints` value. Simpacker does not provide such a helper, so you need to define the helper yourself. You can use `simpacker_context.manifest.lookup!` to access the `manifest.json` in your helper modules.

```ruby
module ApplicationHelper
  def javascript_packs_with_chunks_tag(*names, **options)
    paths = names.flat_map{|name| simpacker_context.manifest.lookup!("entrypoints", name, "assets", "js") }.uniq
    javascript_include_tag(*paths, **options)
  end
end
```

```erb
<%= javascript_packs_with_chunks_tag 'calendar', 'map' %>
```

This will output the following script tags.

```html
<script src="/packs/runtime~calendar-302963ad04fc6a7b892b.js"></script>
<script src="/packs/vendor-302963ad04fc6a7b892b.js"></script>
<script src="/packs/calendar-302963ad04fc6a7b892b.js"></script>
<script src="/packs/runtime~map-302963ad04fc6a7b892b.js"></script>
<script src="/packs/map-302963ad04fc6a7b892b.js"></script>
```
