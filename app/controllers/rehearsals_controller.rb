class RehearsalsController < ApplicationController
  def index
    @rehearsals = Rehearsal.all
  end
end