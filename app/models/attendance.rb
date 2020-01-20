class Attendance < ApplicationRecord

  belongs_to :user
  belongs_to :event   #participator class name User
  #belongs_to :administrator, class_name: "User"    #a ajouter peut etre

  after_create :participation

  def participation
    AttendanceMailer.participation(self.event.administrator, self.user).deliver_now
  end

end
