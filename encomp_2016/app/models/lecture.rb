class Lecture < ActiveRecord::Base
  validates_presence_of :name, :description, :panelist
  validate :start_before_end_time?

  private
  def start_before_end_time?
    if self.start_time > self.end_time
      errors.add(:start_time, "superior ao de termino")
    end
  end

end
