# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:name => 'PNAwluTuUDuM62pA5oRsRpJ+1hTf+r7XwtLNGKIs3zU51jq2TwYTdS89mwxCc9bwwxb6h4LrKUtYZDrvuf+tOQ==', :password => '6vm9d/yXmFLp7GCIhrv3ZtYagqssHRb2LpznRuJfzqplEeRyXD7V5vlm6Cn/pCWB3Q8M0biPvs4MYGQgGt1t/A==')
user = User.find(1)
user.favs.create(:subber => 'Commie', :resolution => 720, :title => 'Sailor') unless user.nil?