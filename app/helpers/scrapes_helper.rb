module ScrapesHelper

	def self.get_resolution(title)
		resolution_match = /(?:\d{3,4}x(\d{3,4})|(\d{3,4})p)/.match(title)
		resolution = resolution_match[2] || resolution_match[1] unless resolution_match.nil?
		resolution = 720 if resolution.nil?

		resolution
	end

	def self.get_bit_encoding(title)
		encoding_match = /(\d+)-?bit/.match(title)
		encoding = encoding_match[1] unless encoding_match.nil?
		encoding = 8 if encoding_match.nil?

		encoding
	end

	def self.format_published_date(published_date) 
		date = Date.parse(published_date.to_s)

		date
	end
end
