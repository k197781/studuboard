class SubjectsController < ApplicationController
  before_action :set_relation, only: [:show]

  # チャットルーム一覧
	def index
		@chatrooms = Chatroom.all
	end

	# 教科別チャットルーム一覧
	def show
		@chatrooms = Chatroom.where(subject: @subject)
	end

	def set_relation
    @subject = params[:rel_type]
    @subject_ja = Constants::SUBJECTS[params[:rel_type].to_sym]
  end
end
