# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  firstname          :string(255)
#  lastname           :string(255)
#  phone              :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'digest'
class User < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  attr_accessor :password
  attr_accessible :firstname, :lastname, :phone, :email, :password, :password_confirmation

  validates_uniqueness_of :email

  validates :lastname, :presence => true,
  :length => { :maximum => 30 }
  validates :firstname, :presence => true,
  :length => { :maximum => 30 }
  validates :email, :presence => true
  validates :phone, :presence => true
  validates :password, :presence => true,
  :confirmation => true,
  :length => { :within => 6..40 }
  before_save :encrypt_password

  def fullname
    self.firstname + " " + self.lastname
  end

  # Return true if the user password matches submitted password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    return nil if user.nil?
    return user if user.salt == cookie.salt
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

  end
