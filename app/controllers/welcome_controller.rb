class WelcomeController < ApplicationController
  def dashboard
  end

  def panels
    sleep 0.5
  end

  def single_panel
    params[:page] = 1 if params[:page].blank?
    sleep 0.5
    render template: "welcome/single_panel", layout: false
  end

  def area_chart
    sleep 0.5
  end

  def notifications
    sleep 1
    # render template: "welcome/notifications", layout: false
  end

  def chats
    sleep 0.5
    # raise
    # render template: "welcome/notifications", layout: false
  end

  def get_classes
    classes = ["fa-user", "fa-user-o", "fa-user-circle-o", "fa-user-circle", "fa-user-times", "fa-user-plus", "fa-user-secret", "fa-users"]
    sleep 0.5
    render json:  {fa_class: classes.sample, ele_id: params[:ele_id]}
  end
end
