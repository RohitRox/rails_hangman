class Authorization < ActiveRecord::Base
	belongs_to :user
	validates :provider, :uid, :presence => true

	def self.find_or_create(auth_hash)

		unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
			binding.pry
			user = User.new(:name => auth_hash["info"]["name"])
			user.save!
			auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			if  auth_hash["provider"] == "twitter"
					auth.secret = auth_hash["credentials"]["secret"]
					auth.token = auth_hash["credentials"]["token"]
					auth.image = auth_hash["info"]["image"]
					auth.nickname = auth_hash["info"]["nickname"]
			end
			auth.save!
		end
		auth
	end

end
