class Cards::InfoCardPreview < Lookbook::Preview
  # @!group Info Card

  # @param title
  # @param accession_numbers
  # @param patient_name
  # @param patient_id
  # @param examination_names
  def study_details(
    title: "Study Details",
    accession_numbers: "MULTIPART001, MULTIPART002",
    patient_name: "John Doe",
    patient_id: "PAT789",
    examination_names: "CT Chest, MRI Brain"
  )
    render "hexarad_shared_components/cards/info_card",
      title:,
      details: [
        {label: "Accession number", value: accession_numbers},
        {label: "Patient name", value: patient_name},
        {label: "Patient ID", value: patient_id},
        {label: "Examination names", value: examination_names}
      ]
  end

  def no_title
    render "hexarad_shared_components/cards/info_card",
      details: [
        {label: "Status", value: "Active"},
        {label: "Last Updated", value: "2 hours ago"},
        {label: "Priority", value: "High"}
      ]
  end

  def content_without_title
    render "hexarad_shared_components/cards/info_card",
      content: "Just some content without a title above it."
  end

  # @!endgroup
end
