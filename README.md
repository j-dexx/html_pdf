# README

Has seeds

Add PDFKit to Gemfile

For Email

```ruby
  class DownloadMailer < ApplicationMailer
    def new(user)
      @user = user
      download = Download.new(@user)
      attachments[download.filename] = File.read(download.to_pdf)
      mail to: "example@example.com", subject: "Whatever"
    end
  end
```

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
