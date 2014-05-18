class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :avatar, :user_auth, :sex, :grade, :prefecture, :mailmag

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "70x70" }

  has_many :friends
  has_many :learnings
  has_many :messages

  # validates :name, :avatar, :sex, :grade, :prefecture, presence: true

  scope :named, ->(q) { where 'name like ?', "%#{q}%" }
  scope :sexed, ->(sex) { where 'sex like ?', "%#{sex}%" }

end
