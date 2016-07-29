class DownloadsController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_user_pdf }

      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end

  private

  def download
    Download.new(user)
  end

  def send_user_pdf
    send_file download.to_pdf, download_attributes
  end

  def render_sample_html
    render download.render_attributes
  end

  def user
    User.find(params[:user_id])
  end

  def download_attributes
    {
      filename: download.filename,
      type: "application/pdf",
      disposition: "inline"
    }
  end
end
