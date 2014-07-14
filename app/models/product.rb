class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :title, { uniqueness: true }
	validates :title, allow_blank: true, length: { minimum: 10, message: 'must be at least 10 characters' } 

	# allow_blank: true was claimed by the tutorial to be for preventing two errors on blank input.
	# This seems imperfect to me as the code does not clearly represent the developer's intentions. 
	validates :image_url, allow_blank: true, 
		format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG, or PNG image.'}

	def self.latest
		Product.order(:updated_at).last
	end
end