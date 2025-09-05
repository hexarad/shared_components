# @label Download Animation
class DownloadAnimationPreview < Lookbook::Preview
  # @label Download Animation
  # @param download_text text "Button text"
  def default(download_text: "Download Report")
    render "hexarad_shared_components/download_animation",
      download_path: "#",
      download_text:
  end

  # @label Custom Download Text
  def custom_text
    render "hexarad_shared_components/download_animation",
      download_path: "/reports/123/download",
      download_text: "Export to PDF"
  end

  # @label Multiple Download Buttons
  def multiple_buttons
    render inline: <<~HTML
      <div style="display: flex; flex-direction: column; gap: 20px;">
        <%= render "hexarad_shared_components/download_animation",
          download_path: "#",
          download_text: "Download CSV" %>
        
        <%= render "hexarad_shared_components/download_animation",
          download_path: "#",
          download_text: "Download PDF" %>
      </div>
    HTML
  end
end