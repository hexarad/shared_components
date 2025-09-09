# frozen_string_literal: true

module HexaradSharedComponents
  class Engine < ::Rails::Engine
    isolate_namespace HexaradSharedComponents

    # Make views available to host application
    initializer 'hexarad_shared_components.view_paths' do
      ActiveSupport.on_load(:action_controller) do
        append_view_path Engine.root.join('app', 'views')
      end
    end

    # Configure asset pipeline
    initializer 'hexarad_shared_components.assets.precompile' do |app|
      app.config.assets.precompile += %w[hexarad_shared_components_manifest.js]
      app.config.assets.paths << Engine.root.join('app', 'assets', 'stylesheets')
      app.config.assets.paths << Engine.root.join('app', 'javascript')

      # Precompile the main entry point
      app.config.assets.precompile << 'hexarad_shared_components.js'

      # Automatically include all JavaScript files from the engine
      js_files = Dir[Engine.root.join('app', 'javascript', '**', '*.js')]
      js_files.each do |file|
        relative_path = Pathname.new(file).relative_path_from(Engine.root.join('app', 'javascript'))
        app.config.assets.precompile << "hexarad_shared_components/#{relative_path}"
      end
    end

    # Configure importmap
    initializer 'hexarad_shared_components.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << Engine.root.join('config', 'importmap.rb') if app.config.respond_to?(:importmap)
      app.config.importmap.cache_sweepers << Engine.root.join('app', 'javascript') if app.config.respond_to?(:importmap)
    end
  end
end
