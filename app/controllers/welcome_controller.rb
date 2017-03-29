class WelcomeController < ApplicationController
  def dashboard
  end

  def notifications
    render template: "welcome/notifications", layout: false
    # render template: "welcome/notifications"
  end
end
