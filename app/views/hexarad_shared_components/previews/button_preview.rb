# @label Buttons
class ButtonPreview < Lookbook::Preview
  # @label Primary Button
  # @param text text "Button text"
  # @param disabled toggle "Disabled state"
  def primary(text: "Click Me", disabled: false)
    render "hexarad_shared_components/buttons/button", 
      text:, 
      variant: "primary", 
      disabled:
  end

  # @label Secondary Button
  # @param text text "Button text"
  # @param disabled toggle "Disabled state"
  def secondary(text: "Cancel", disabled: false)
    render "hexarad_shared_components/buttons/button", 
      text:, 
      variant: "secondary", 
      disabled:
  end

  # @label Button as Link
  # @param text text "Button text"
  # @param path text "Link path"
  def as_link(text: "Go to Dashboard", path: "/dashboard")
    render "hexarad_shared_components/buttons/button", 
      text:, 
      path:
  end

  # @label Form Submit Button
  def with_form
    render inline: <<~HTML
      <%= form_with url: "#", local: true do |form| %>
        <%= render "hexarad_shared_components/buttons/button", 
          text: "Submit Form", 
          form: %>
      <% end %>
    HTML
  end
end