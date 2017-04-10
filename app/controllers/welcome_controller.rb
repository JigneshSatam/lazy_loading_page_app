class WelcomeController < ApplicationController
  def dashboard
  end

  def notifications
    sleep 2
    # render template: "welcome/notifications", layout: false
  end

  def chats
    sleep 2
    # raise
    # render template: "welcome/notifications", layout: false
  end

  def get_classes
    classes = ["fa-user", "fa-user-o", "fa-user-circle-o", "fa-user-circle", "fa-user-times", "fa-user-plus", "fa-user-secret", "fa-users"]
    sleep 2
    render json:  {fa_class: classes.sample, ele_id: params[:ele_id]}
  end
end
