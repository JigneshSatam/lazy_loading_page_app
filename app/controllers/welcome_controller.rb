class WelcomeController < ApplicationController
  def dashboard
  end

  def notifications
    # render template: "welcome/notifications", layout: false
  end

  def chats
    raise
    # render template: "welcome/notifications", layout: false
  end
end
