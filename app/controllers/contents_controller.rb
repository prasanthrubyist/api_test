class ContentsController < ApplicationController
  def index
    @contents = Content.all
    json_response(@contents)
  end

  def create
    @content = Content.create!(content_params)
    json_response(@content, :created)
  end
  private
  def content_params
  	params.permit(:title, :published_date, :author, :summary, :content, :status)
  end	
end
