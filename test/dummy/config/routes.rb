Rails.application.routes.draw do
  mount HexaradSharedComponents::Engine => "/hexarad_shared_components"
  mount Lookbook::Engine, at: "/lookbook" if defined?(Lookbook)
  
  root to: redirect("/lookbook")
end