# @label Download Animation
class Buttons::WithAnimation::DownloadAnimationPreview < Lookbook::Preview
  # @!group Download Animation

  # @param download_text text "Button text"
  def default(download_text: "Download Report")
    render "hexarad_shared_components/download_animation",
      download_path: "#",
      download_text: download_text
  end

  # @!endgroup
end