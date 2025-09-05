Rails.application.configure do
  if defined?(Lookbook)
    config.lookbook.project_name = "Hexarad Shared Components"
    config.lookbook.preview_paths = [
      Rails.root.join("../../test/components/previews")
    ]
    config.lookbook.ui_theme = "blue"
    config.lookbook.preview_controller = "ApplicationController"
  end
end