# README

Has seeds

Add PDFKit to Gemfile

If Rails version < 5

Add

gem "render_anywhere", require: false

Then in download.rb

```ruby
require "render_anywhere"

class Download
  include RenderAnywhere

  private

  def as_html
    render render_attributes
  end
end
```
