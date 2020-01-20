class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendance

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :first_name, presence: true

  validates :last_name, presence: true

  has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event", dependent: :destroy

  #envoyer les mails à la création de l'user

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end
