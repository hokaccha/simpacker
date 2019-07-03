# Simpacker Rails Engines example

## Settings for engine

### my_engine/config/simpacker.yml

```yaml
default: &default
  manifest_path: public/packs/my_engine/manifest.json

development:
  <<: *default
  cache_manifest: false

test:
  <<: *default
  cache_manifest: false

production:
  <<: *default
  cache_manifest: true
```

### my_engine/lib/my_engine.rb

```ruby
require "my_engine/engine"

module MyEngine
  ROOT_PATH = Pathname.new(File.join(__dir__, ".."))

  def self.simpacker_context
    @simpacker_context ||= Simpacker::Context.new(root_path: ROOT_PATH)
  end
end
```

### my_engine/app/helpers/my_engine/application_helper.rb

```ruby
module MyEngine
  module ApplicationHelper
    include Simpacker::Helper

    def simpacker_context
      MyEngine.simpacker_context
    end
  end
end
```

## Serving

```ruby
# config/application.rb
config.middleware.use(Rack::Static, urls: ["/packs/my_engine"], root: MyEngine::Engine.root.join("public"))
```
