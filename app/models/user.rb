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
  
  has_many :roles
  
  
  before_save :auto_hash
  after_save :clear_password
  
  ##########################
  # Defining Roles
  #
  # List roles from least permissions to 
  # highest permissions
  ##########################
  ROLES = %w[admin superadmin]
  
  # authenticates the user using base-class methods
  def self.authenticate(username="", pass="") 
    # find the user by name
    u = User.find_by_username(username)
    # make passed password string salted, then compare
    # with what is in the database
    if u && u.password_match?(pass)
      # return the User object
      return u
    else 
      return false
    end
  end
  
  # compares the stored hashed_password with a passed string
  def self.password_match(password="")
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
  
  ## 
  # Checks the role against the user
  ##
  def is?(role)
    roles.include?(role.to_s)
  end
  
end
