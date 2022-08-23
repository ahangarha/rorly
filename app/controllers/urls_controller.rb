class UrlsController < ApplicationController
  def show
    id = helpers.to_id(params[:id])
    @url = Url.find(id)
    @shortened_url = "#{root_url}#{params[:id]}"
  end

  def new
    @url = Url.new
  end

  def create
    url = Url.new(url_params)

    raise 'Invalid URL' unless url.valid?

    # Generate short URL
    # We do not generate any short URL but use base64 of the id as the short
    # URL. So we just record the original URL in in the database and will
    # access that by converting the short url to id.

    if url.save!
      redirect_to(action: 'show', id: helpers.short_url(url.id))
    else
      puts 'Failed to save this URL'
    end
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
