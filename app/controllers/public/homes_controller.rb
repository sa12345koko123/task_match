class Public::HomesController < ApplicationController

  def top
    @jobs = Job.all.order(created_at: :desc)
  end

  def about
  end
end
