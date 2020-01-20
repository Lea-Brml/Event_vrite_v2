class Event < ApplicationRecord

  has_one_attached :avatar

  has_many :attendances
  has_many :users, through: :attendance

  belongs_to :administrator, class_name: "User"     #affaire à suivre

  validates :start_date, presence: true

  validates :duration, presence: true

  validates :title, presence: true
  validates :title, length: {minimum: 5, maximum: 140}

  validates :description, presence: true
  validates :description, length: {minimum: 20, maximum:1000}

  validates :price, numericality: {greater_tan: 0, less_than: 1001}
  validates :location, presence: true

  validate :multiple_of_5?

  validate :start_date_time


  def multiple_of_5?

    if self.duration != nil
      errors.add(:duration, "La duree doit etre un multiple de 5 !") unless
      self.duration % 5 == 0
    end

  end


  def start_date_time

    if self.start_date != nil
      errors.add(:start_date, "Tu ne peux pas créer un évènement dans le passé") unless
      self.start_date > Time.now
    end

  end

  end
