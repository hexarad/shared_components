# Hexarad Shared Components

A Rails engine containing reusable UI components for Hexarad applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexarad_shared_components', path: '../hexarad_shared_components'
```

And then execute:

```bash
$ bundle install
```

## Usage

### In Your Rails App

#### 1. Import Stylesheets

In your main stylesheet:

```scss
@import "hexarad_shared_components/application";
```

#### 2. Import JavaScript Controllers

In your importmap:

```ruby
pin "hexarad_shared_components", to: "hexarad_shared_components.js"
pin_all_from "hexarad_shared_components/app/javascript/hexarad_shared_components", under: "hexarad_shared_components", to: "hexarad_shared_components"
```

In your application.js:

```javascript
import "hexarad_shared_components"
```

#### 3. Use Components in Views

```erb
<%= render "hexarad_shared_components/buttons/button", 
  text: "Click Me", 
  variant: "primary" %>

<%= render "hexarad_shared_components/cards/info_card",
  title: "Information",
  details: [
    { label: "Name", value: "John Doe" },
    { label: "Status", value: "Active" }
  ] %>
```

## Viewing Components with Lookbook

To view and interact with the component library:

```bash
cd ~/code/hexarad/hexarad_shared_components
bundle install
rails s -p 3001
```

Then visit http://localhost:3001/lookbook

## Development

Components are located in:
- Views: `app/views/hexarad_shared_components/`
- Styles: `app/assets/stylesheets/hexarad_shared_components/components/`
- JavaScript: `app/javascript/hexarad_shared_components/controllers/`
- Previews: `app/views/hexarad_shared_components/previews/`
