class SessionsController < ApplicationController
  def create
    raise request.env['omniauth.auth'].inspect
  end
end
