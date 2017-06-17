class HomeController < ApplicationController
  
  def top
    if user_signed_in? && !(current_user.studentType == "その他")
      $studentyear = current_user.studentYear
      redirect_to mytop_path
    end
    @chatrooms = Chatroom.order(:updated_at)
  end
  
  def about
  end
  
  def mytop
    unless defined? $studentyear
      redirect_to root_path
    end
    @chatrooms = Chatroom.order("updated_at")
  end
  
  def mystudentyear
    #topページ下部のボタンからのリンク接続
    if params[:studentyear].present? then
      $studentyear = params[:studentyear].to_i
      redirect_to mytop_path
    elsif params[:subject].present? then
      subyear = params[:subject].partition(/[3-6]/)
      $subject = subyear[0]
      $studentyear = subyear[1].to_i
      redirect_to chatrooms_path
    elsif params[:chatroom].present? then
      subyearid = params[:chatroom].partition(/[3-6]/)
      $subject = subyearid[0]
      $studentyear = subyearid[1].to_i
      redirect_to chatroom_path(subyearid[2].to_i)
    end
      
  end
  
  def mysubject
    #topページ下部のボタンからのリンク接続
    if params[:subject].present? then
      $subject = params[:subject]
      redirect_to chatrooms_path
    elsif params[:chatroom].present? then
      subyearid = params[:chatroom].partition(/[0-9]*$/)
      $subject = subyearid[0]
      redirect_to chatroom_path(subyearid[1].to_i)
    end
  end
end