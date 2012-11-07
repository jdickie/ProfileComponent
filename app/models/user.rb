require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :username, :email
  attr_protected :hashed_password, :salt
  ####################
  # non-db variables #
  ####################
  attr_accessor :password
  
  
  ####################
  # validations      #
  ####################
  
  validates :username, :uniqueness => true, :length => { :maximum => 25, :minimum => 4 }
  # validating email to prevent attacks
  validates_format_of :email, :with =>
    /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates :email, :uniqueness => true
  
  # checks length of the password when user first enters it
  validates_length_of :password, :within => 8..25, :on => :create
  
  ##########################
  # Relationships for User #
  ##########################
  
  
  before_save :auto_hash
  after_save :clear_password
  
  ##########################
  # Defining Roles
  #
  # ROLES Array
  # List roles as an array. ROLES is
  # then used  as a cross-reference
  # with roles_mask using the roles= and roles functions
  #
  # Taken from the requirements for the People App
  #
  #
  ##########################
  ROLES = ['guest', 'event admin', 'comm viewer', 'comm editor', 'comm admin', 'course viewer', 
    'course scheduler', 'course admin', 'facility viewer', 'facility editor', 'facility admin', 
    'appt viewer', 'appt secured', 'appt reviewer', 'appt scheduler', 'appt admin', 'profile', 
    'profile viewer', 'profile editor', 'profileadmin', 'admindepartment', 'admin']
  
  def self.admin_index
    1 & 2**ROLES.length
  end
 
  ROLES_DESC = ['Guest account. No permissions except for viewing.',
    'Event Administrator.', 
    'Committee Viewer. View all committee info and run report.',
    'Committee Editor. Edit, View : Committee.',
    'Committee Administrator. All : Committee.',
    'Course Viewer. View : Courses',
    'Course Schedule. Edit, View : Courses',
    'Course Administrator. All : Courses',
    'Facility Viewer. View : Facility.',
    'Facility Editor. Edit, View : Facility.',
    'Facility Administrator. All : Facility.',
    'Appointment Viewer. View : Appointment - Non-sensitive',
    'Appointment Secured. View : Appointment - All',
    'Appointment Reviewer. Edit, View : Appointment',
    'Appointment Scheduler. All : Appointment, Contract',
    'Appointment Administrator. All : Appointment, Contract',
    'Default User. View, Edit : Profile (Own)',
    'Profile Viewer. View : Profile',
    'Profile Editor. Edit, View : Profile',
    'Profile Administrator. All : Profile',
    'Departmental Administrator. All : All (Department)',
    'Administrator. All : All']
  
  ######################
  # Roles-based authentication - defining mask for
  # roles. Roles act as individual integers, which is
  # the efficient way of storing them. 
  ######################
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def roles_desc 
    roles_id.each do |r|
      Role.find(r)
    end
  end
  
  # authenticates the user using base-class methods
  def self.authenticate(username="", password="") 
    # find the user by name
    u = User.find_by_username(username)
    # make passed password string salted, then compare
    # with what is in the database
    if u && u.password_match?(password)
      # return the User object
      return u
    else 
      return false
    end
  end
  
  # compares the stored hashed_password with a passed string
   def password_match?(password="")
     hashed_password == User.hash_with_salt(password, salt)
   end
  
  
  # Creates a salt to be added dynamically to the password
  # in order to create a more secure hashed password
  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Inanother#{Time.now}momentdownwent#{username}afterit")
  end
  
  # creates a hashed version of the password
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest(salt + password)
  end
  
  def ability 
    @ability ||= Ability.new(self)
  end
  
  ## 
  # Checks the role against the user
  ##
  def is?(role)
    # Fetch roles of the user    
    roles.include?(role.to_s)
  end
  
  private 
  
  # used to automate creating hashed password
  def auto_hash
    unless password.blank?
      self.salt = User.make_salt(username) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end
  
  # used to change password
  def clear_password 
    self.password = nil
  end
  
end
