class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments

  validates :username, uniqueness: true
  validates :username, :password, null: false
  validate :password_length

  def password
  	@password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @pw_length = new_password.length
  	@password = BCrypt::Password.create(new_password)
  	self.hashed_password = @password
  end

  def authenticate?(pass_guess)
  	self.password == pass_guess
  end

  def password_length
    if @pw_length == 0
      self.errors.add(:password, "required.")
    elsif @pw_length < 4
      self.errors.add(:password, "must be at least four characters long.")
    end
  end

end

### be rake -T (look at all available rake commands)
