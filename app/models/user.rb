 class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :company_url, :linked_public_profile, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :provider, :uid, :company_name, :zip_code, :needs, :offerings, :google_plus_profile_url, :skype, :phone, :needs_attributes, :offerings_attributes, :linked_in_image_url
  
	attr_writer :current_step

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :uniqueness => true
  validates :zip_code, :numericality => { :only_integer => true }, :allow_blank => true
  validates :phone, :numericality => { :only_integer => true }, :allow_blank => true
  validates :company_url,
            :length => { :maximum => 100, :allow_nil => true, :allow_blank => true},
            :format => { :with => URI::regexp, :allow_nil => true, :allow_blank => true}
  validates :google_plus_profile_url,
            :length => { :maximum => 100, :allow_nil => true, :allow_blank => true},
            :format => { :with => URI::regexp, :allow_nil => true, :allow_blank => true}          

  has_many :needs
  has_many :offerings
  has_many :meetings, :through => :user_meetings
  has_many :user_meetings
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

  def name
    first_name + " " + last_name
  end
end
