class ApplicationController < ActionController::Base
  after_filter :verify_authorized, :except => :index

  include Pundit
  protect_from_forgery
end
