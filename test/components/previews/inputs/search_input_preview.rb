class Inputs::SearchInputPreview < Lookbook::Preview
  # @!group Search Input

  # @param label_text
  # @param placeholder
  # @param value
  def default(label_text: "ACCESSION NUMBER", placeholder: "Enter accession", value: "")
    render_with_template(
      template: "inputs/search_input_preview/default",
      locals: {
        label_text: label_text,
        placeholder: placeholder,
        value: value,
        field_name: :accession_number
      }
    )
  end
  # @!endgroup
end
