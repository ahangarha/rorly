require 'base64'

module UrlsHelper
  def short_url(id)
    Base64.strict_encode64 id.to_s
  end

  def to_id(short_url)
    Base64.strict_decode64(short_url).to_i
  end
end
