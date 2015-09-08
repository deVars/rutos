# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:name => 'PNAwluTuUDuM62pA5oRsRpJ+1hTf+r7XwtLNGKIs3zU51jq2TwYTdS89mwxCc9bwwxb6h4LrKUtYZDrvuf+tOQ==', :password => '6vm9d/yXmFLp7GCIhrv3ZtYagqssHRb2LpznRuJfzqplEeRyXD7V5vlm6Cn/pCWB3Q8M0biPvs4MYGQgGt1t/A==')

user = User.find(1)
user.favs.create(:subber => 'ross_subs_1', :resolution => 720, :title => 'fav test') unless user.nil?
user.favs.create(:subber => 'ross_subs_2', :resolution => 1080, :title => 'shaolin sumo') unless user.nil?
user.favs.create(:subber => 'ross_subs_2', :resolution => 1080, :title => 'childrens cartoon') unless user.nil?

Scrape.create(:subber => 'ross_subs_1', :title => 'fav test', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_1', :title => 'fav test', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_1', :title => 'es ugles', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_1', :title => 'barrackie v', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_2', :title => 'fav test', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_2', :title => 'shaolin sumo', :resolution => 1080, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_3', :title => 'fav test', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_3', :title => 'bebe bebe a bebe', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_3', :title => 'lord of the blings', :resolution => 720, :bit_encoding => 8, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")

Scrape.create(:subber => 'ross_subs_1', :title => 'fav test', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_1', :title => 'fav test', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_1', :title => 'es ugles', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_1', :title => 'watch me', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_2', :title => 'fav test', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_2', :title => 'this is childrens cartoon. i promise', :resolution => 1080, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_3', :title => 'fav test', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_3', :title => 'blah', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")
Scrape.create(:subber => 'ross_subs_3', :title => 'orc x butcher', :resolution => 720, :bit_encoding => 10, :url => 'http://www.example.com', :was_downloaded => false, :publish_date => "01/01/2011")


