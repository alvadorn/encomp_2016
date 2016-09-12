class Course < ActiveRecord::Base
  has_and_belongs_to_many :users, touch: true


  def vancancies_left=(value)
    @vacancies_left = value
  end

  def vacancies_left
    @vacancies_left
  end

end
