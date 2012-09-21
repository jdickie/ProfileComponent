require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :username, :email
  attr_protected :hashed_password, :salt
  
  # non-db variables
  attr_accessor :password
  
  validates :username, :uniqueness => true, :length => { :maximum => 25, :minimum => 8 }
  # validating email to prevent attacks
  validates_format_of :email, :with =>
    /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates :email, :uniqueness => true
  
  # checks length of the password when user first enters it
  validates_length_of :password, :within => 8..25, :on => :create
  
  
  before_save :auto_hash
  after_save :clear_password
  
  # authenticates the user using base-class methods
  def authenticate(username="", pass="") 
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
  def password_match(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end
  
  private
  
  
  # Creates a salt to be added dynamically to the password
  # in order to create a more secure hashed password
  def make_salt(username="")
    Digest::SHA1.hexdigest("Inanother#{Time.now}momentdownwent#{username}afterit")
  end
  
  # creates a hashed version of the password
  def hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest(salt + password)
  end
  
  # used to automate creating hashed password
  def auto_hash
    unless password.blank?
      self.salt = User.make_salt(username) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, self.salt)
    end
  end
  
  # used to change password
  def clear_password 
    self.password = nil
  end
  
end
