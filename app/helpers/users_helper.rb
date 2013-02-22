module UsersHelper

	def image_url(user)
		user.linked_in_image_url.nil? ? "Profile-Picture.png": user.linked_in_image_url
	end

	def button_name(user)
		if user.new_record?
			user.last_step? ? "Complete" : "Next"
		else
			"Update"
		end
	end


	def upcoming_meetings(user)
		@user.meetings.where("meeting_time > :today_time", :today_time => Time.now)
	end

	def past_meetings(user)
		@user.meetings.where("meeting_time < :today_time", :today_time => Time.now)
	end

	def meeting_with(meeting)
		user = meet.users.where("users.id != :current_user", :current_user => current_user.id)
		user.first.name
	end


	def offers_matching(user)
		user_needs = []
		user_needs = user.needs.collect {|need| user_needs << need if need.present? }
		offer_matching = Offering.where("offerings.title IN (?)",user_needs) 
	end

	def needs_matching(user)
		user_offerings = []
		user_offerings = user.offerings.collect {|offering| user_offerings << offering if offering.present? }
		Need.where("needs.title IN (?)",user_offerings)
	end

	def user_needs(user)
		user_needs = []
		user_needs = user.needs.collect {|need| user_needs << need if need.present? }
		user_needs.join(", ")
	end

	def user_offerings(user)
		user_offerings = []
		user_offerings = user.offerings.collect {|offering| user_offerings << offering if offering.present? }
		user_offerings.join(", ")
	end
end
