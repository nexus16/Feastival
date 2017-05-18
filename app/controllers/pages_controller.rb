class PagesController < ApplicationController
  def show
    if valid_page?
      render "pages/#{params[:page]}"
    else
      render "public/404.html", status: :not_found
    end
  end

  def valid_page?
    File.exist? Pathname.new(
      Rails.root.join("app", "views", "pages", "#{params[:page]}.html.erb")
    )
  end
end
