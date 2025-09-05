class ApplicationController < ActionController::Base
  layout "application"
  
  # Methods required by Lookbook for preview rendering
  def prepend_application_view_paths
    prepend_view_path HexaradSharedComponents::Engine.root.join("app", "views")
    prepend_view_path Rails.root.join("app", "views")
  end

  def prepend_preview_examples_view_path
    prepend_view_path Rails.root.join("../../test/components/previews")
  end

  # Helper method for Lookbook
  def lookbook_preview_controller?
    true
  end
  
  # Layout determination for Lookbook
  def determine_layout(layout_name = nil)
    if layout_name
      { layout: layout_name }
    else
      { layout: "application" }
    end
  end
end