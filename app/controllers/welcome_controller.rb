class WelcomeController < ApplicationController
  def dashboard
  end

  def notifications
    render partial: "welcome/notifications"
  end
end
