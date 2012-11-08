require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :username, :email, :roles
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
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles
  
  before_save :auto_hash
  after_save :clear_password
  
  ######################
  # Roles-based authentication - defining mask for
  # roles. Roles act as individual integers, which is
  # the efficient way of storing them. 
  ######################
  def add_role(role)
    # add role to the roles enumerable
    if (role.class == String)
      role = Role.find(role)
    end
    
    if (self.roles.exists?(role) == false)
      self.roles<<role
    end  
  end
  
  # Returns an array of :name values from each
  # of the IDs in the roles enumerable
  def get_roles
    self.roles.map { |r| Role.find(r).name }
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
    r = Role.where("name = ?", role)
    
    # Fetch roles of the user    
    roles.include?(r)
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
