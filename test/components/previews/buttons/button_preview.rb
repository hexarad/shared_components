# @label Button
class Buttons::ButtonPreview < Lookbook::Preview
  # @!group Button

  # @param text
  def basic(text: "Click me")
    render "hexarad_shared_components/buttons/button",
      text:,
      path: "#"
  end

  def secondary_variant
    render "hexarad_shared_components/buttons/button",
      text: "Cancel",
      path: "#",
      variant: "secondary"
  end

  def disabled
    render "hexarad_shared_components/buttons/button",
      text: "Disabled button",
      path: "#",
      disabled: true
  end

  # @!endgroup
end
