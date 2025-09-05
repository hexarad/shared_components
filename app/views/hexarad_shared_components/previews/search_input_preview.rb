# @label Search Inputs
class SearchInputPreview < Lookbook::Preview
  # @label Basic Search Input
  # @param label_text text "Label text"
  # @param field_name text "Field name"
  # @param placeholder text "Placeholder text"
  def basic(label_text: "Search", field_name: "search_query", placeholder: "Enter search term...")
    render inline: <<~HTML
      <%= form_with url: "#", local: true do |form| %>
        <%= render "hexarad_shared_components/inputs/search_input",
          form:,
          label_text:,
          field_name:,
          placeholder: %>
      <% end %>
    HTML
  end

  # @label Search Input with Value
  # @param value text "Initial value"
  def with_value(value: "Initial search term")
    render inline: <<~HTML
      <%= form_with url: "#", local: true do |form| %>
        <%= render "hexarad_shared_components/inputs/search_input",
          form:,
          label_text: "Search Orders",
          field_name: "order_search",
          placeholder: "Search by order ID or patient name",
          value: %>
      <% end %>
    HTML
  end

  # @label Search Input with Data Attributes
  def with_data_attributes
    render inline: <<~HTML
      <%= form_with url: "#", local: true do |form| %>
        <%= render "hexarad_shared_components/inputs/search_input",
          form:,
          label_text: "Live Search",
          field_name: "live_search",
          placeholder: "Type to search...",
          data: {
            controller: "search-filter",
            action: "input->search-filter#search",
            "search-filter-target": "input"
          } %>
      <% end %>
    HTML
  end
end