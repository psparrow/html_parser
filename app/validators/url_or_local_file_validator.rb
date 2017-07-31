class UrlOrLocalFileValidator < ActiveModel::EachValidator
  def self.valid?(value)
    return true if File.file?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    unless value.present? && self.class.valid?(value)
      record.errors.add(attribute, 'must be a URL or local file')
    end
  end
end
