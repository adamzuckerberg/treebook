class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :statuses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                            uniqueness: true,
                            format: {
                             with: /\A[a-zA-Z0-9_-]+\z/,
                              message: "must be formatted correctly."
                            }

  def full_name
  	first_name + " " + last_name + " " + 'juniour'
  end

end
