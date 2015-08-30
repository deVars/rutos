class Fav < ActiveRecord::Base
	validates :subber, :title, :resolution, presence: true

  	belongs_to :user
end
