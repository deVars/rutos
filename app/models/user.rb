class User < ActiveRecord::Base
	validates :name, uniqueness: true
	validates :name, :password, presence: true
	
	has_many :favs, dependent: :destroy
end
