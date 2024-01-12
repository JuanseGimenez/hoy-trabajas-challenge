class ApplicationController < ActionController::Base
  protect_from_forgery if: -> { format_json? }
  # TODO: Add authentication for JSON requests(JWT + Devise)
  before_action :authenticate_user!, unless: :format_json?
  rescue_from ActiveRecord::RecordNotFound, with: ->(e) { format_json? ? record_not_found : raise(e) }

  private

  def format_json? = request.format.json?
end
