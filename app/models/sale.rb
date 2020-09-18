class Sale < ApplicationRecord
	before_create :generate_guid
	belongs_to :content

	private

	def generate_guid
		self.guid = SecureRandom.uuid()
	end
end
