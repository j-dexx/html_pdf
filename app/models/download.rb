class Download
  def initialize(user)
    @user = user
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("tmp/#{ user.id }.pdf")
  end

  def filename
    "#{ user.name }.pdf"
  end

  def render_attributes
    {
      template: "downloads/pdf",
      layout: 'pdf',
      locals: {
        user: user
      }
    }
  end

  private

  attr_reader :user

  def as_html
    ApplicationController.render render_attributes
  end
end
