class Url < ApplicationRecord
  validates(
    :original_url,
    format: {
      with: %r{\Ahttps?://.+\z},
      message: 'only excepts stings starting with "|http(s)://"'
    }
  )
end
