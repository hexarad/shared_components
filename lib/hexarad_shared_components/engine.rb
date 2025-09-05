module HexaradSharedComponents
  class Engine < ::Rails::Engine
    isolate_namespace HexaradSharedComponents

    # Make views available to host application
    initializer "hexarad_shared_components.view_paths" do
      ActiveSupport.on_load(:action_controller) do
        append_view_path Engine.root.join("app", "views")
      end
    end

    # Configure asset pipeline
    initializer "hexarad_shared_components.assets.precompile" do |app|
      app.config.assets.precompile += %w[hexarad_shared_components_manifest.js]
      app.config.assets.paths << Engine.root.join("app", "assets", "stylesheets")
      app.config.assets.paths << Engine.root.join("app", "javascript")
    end

    # Configure importmap
    initializer "hexarad_shared_components.importmap", before: "importmap" do |app|
      app.config.importmap.paths << Engine.root.join("config", "importmap.rb") if app.config.respond_to?(:importmap)
      app.config.importmap.cache_sweepers << Engine.root.join("app", "javascript") if app.config.respond_to?(:importmap)
    end
  end
end
