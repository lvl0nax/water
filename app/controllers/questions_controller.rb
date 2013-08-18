class QuestionsController < ApplicationController
  # GET /coolers
  # GET /coolers.json
  def index
    @articles = Question.all.group_by(&:article)
    respond_to do |format|
      format.html
    end
  end

end
