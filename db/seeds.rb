# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create([{first_name: 'John', last_name: 'Matt', email: 'john@example.com', skype: 'johnm',
			google_plus_profile_url: 'https://plus.google.com/u/0/1234545304989532457700/posts', zip_code: '421005',
			company_name: 'Cloudspoke Inc.', phone: '9025765412', about: 'This is john and I am software developer',
			linked_public_profile: 'http://www.linkedin.com/profile/view?id=50548339', company_url: 'http://www.cloudspokes.com/'}])

user2 = User.create([{first_name: 'Alexender', last_name: 'Mack', email: 'alexender@example.com', skype_username: 'alexm',
			google_plus_profile_url: 'https://plus.google.com/u/0/1234534304989532457700/posts', zip_code: '421003',
			company_name: 'Facebook Inc.', phone: '9024376521', about: 'This is Alexender and I am vice presedent of facebook.',
			linkedin_profile_url: 'http://www.linkedin.com/profile/view?id=50544399', company_url: 'http://www.facebook.com/'}])
user1 = user1.first
user2 = user2.first

user1.needs.create([{title: 'designer name'}])
user1.needs.create([{title: 'attorney name'}])
user1.needs.create([{title: 'painter name'}])
user1.needs.create([{title: 'accountant name'}])

user2.needs.create([{designer: 'designer name'}])
user2.needs.create([{designer: 'attorney name'}])
user2.needs.create([{designer: 'painter name'}])
user2.needs.create([{designer: 'pr firm name'}])


user1.offerings.create([{title: 'webonized solution'}])
user1.offerings.create([{title: 'BMC Software'}])
user1.offerings.create([{title: 'db_admin'}])

user2.offerings.create([{title: 'webonized solution'}])
user2.offerings.create([{title: 'BMC Software'}])
user2.offerings.create([{title: 'db_admin'}])

user1.matches.create([{top_matches: 'UK', upcoming_meetings: 'With new jersy', past_meetings: 'with new york office'}])

user1.matches.create([{top_matches: 'US', upcoming_meetings: 'With new fabeook', past_meetings: 'with steve job, CEO of Applie Inc.'}])

user2.matches.create([{top_matches: 'NZ', upcoming_meetings: 'With new west europe', past_meetings: 'with bill gates'}])

user2.matches.create([{top_matches: 'IN', upcoming_meetings: 'meeting with india prime minister', past_meetings: 'meeting with pakistan PM'}])

meeting1 = user1.matches.create(:meeting_details => 'With new jersy', :meeting_time => DateTime.now)
meeting2 = user1.matches.create(:meeting_details => 'With new fabeook', :meeting_time => DateTime.now.next_day)
meeting3 = user1.matches.create(:meeting_details => 'With new west europe', :meeting_time => DateTime.now.next_day.next_day)

UserMeeting.create(:user_id => user2.id, :meeting_id => meeting1.id)
UserMeeting.create(:user_id => user2.id, :meeting_id => meeting2.id)
UserMeeting.create(:user_id => user2.id, :meeting_id => meeting3.id)