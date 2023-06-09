# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, flash: { alert: exception.message }
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    flash.now[:alert] = error.message
    render "errors/404", status: 404, layout:'errors'
  end
end
