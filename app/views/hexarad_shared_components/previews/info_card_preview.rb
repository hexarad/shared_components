# @label Info Cards
class InfoCardPreview < Lookbook::Preview
  # @label Card with Details
  def with_details
    details = [
      { label: "Patient Name", value: "John Doe" },
      { label: "MRN", value: "123456" },
      { label: "Study Date", value: "2024-01-15" },
      { label: "Modality", value: "MRI" }
    ]
    
    render "hexarad_shared_components/cards/info_card",
      title: "Study Information",
      details:
  end

  # @label Card with Content
  # @param title text "Card title"
  # @param content textarea "Card content"
  def with_content(title: "Important Note", content: "This is an important message that should be displayed prominently to the user.")
    render "hexarad_shared_components/cards/info_card",
      title:,
      content:
  end

  # @label Card without Title
  def without_title
    details = [
      { label: "Status", value: "Active" },
      { label: "Priority", value: "High" },
      { label: "Assigned To", value: "Dr. Smith" }
    ]
    
    render "hexarad_shared_components/cards/info_card",
      details:
  end

  # @label Card with Long Values (Tooltip)
  def with_long_values
    details = [
      { label: "Description", value: "This is a very long description that will be truncated and show a tooltip when hovered over" },
      { label: "Short Value", value: "Normal" }
    ]
    
    render "hexarad_shared_components/cards/info_card",
      title: "Tooltip Example",
      details:
  end
end