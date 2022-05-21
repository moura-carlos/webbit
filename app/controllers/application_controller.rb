class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # basically means: before this controller loads,
  # go ahead and find and execute the find_communites method.
  # thus it'll give us access to all the communities in our app.
  before_action :find_communities


  protected

  def find_communities
    @communities = Community.all.order(:title)
  end

  def configure_permitted_parameters
    # added attributes
    # this code essencially allows the user to signup with the user name and edit their profile
    # with their user name
    added_attrs = [:username, :comment_subscription]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
