class CoursesController < ApplicationController

  # show all
  def index_by_dates
    @day20 = Course.where(day: Date.new(2016, 9, 20))
    @day21 = Course.where(day: Date.new(2016, 9, 21))
    @day22 = Course.where(day: Date.new(2016, 9, 22))
    @day23 = Course.where(day: Date.new(2016, 9, 23))
  end

end
