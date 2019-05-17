class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'].to_s, password: ENV['password'].to_s

  def show
  end
end
