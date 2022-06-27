class SignUpUser
  prepend SimpleCommand

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  def call
    sign_up_user = user
    JsonWebToken.encode(user_id: sign_up_user.id) if sign_up_user
  end

  private

  attr_accessor :email, :password, :name

  def user
    user = User.find_by_email(email)

    if user
      errors.add :user_sign_up, "User already exists"
      return nil
    else
      begin
        user = User.create!(name: name.downcase, email: email, password: password, password_confirmation: password)
      rescue => e
        errors.add :user_sign_up, "Unable to create user"
      end
      user
    end
  end
end
