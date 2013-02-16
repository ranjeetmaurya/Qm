class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :provider, :uid, :company_name, :zip_code, :needs, :offerings, :google_plus, :skype, :phone, :needs_attributes, :offerings_attributes
  
	attr_writer :current_step

	validate :reset_password_token, :presence => true

  has_many :needs
  has_many :offerings
  accepts_nested_attributes_for :needs
  accepts_nested_attributes_for :offerings

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.first_name  = auth.info.first_name
  		user.last_name = auth.info.last_name
  		user.email = auth.info.email
  	end
  end

  def current_step
  	@current_step || steps.first
	end

  def steps
  	%w[about need offering ways_to_connect]
	end

	def next_step
	  self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
	  self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
	  current_step == steps.first
	end

	def last_step?
	  current_step == steps.last
	end

end
