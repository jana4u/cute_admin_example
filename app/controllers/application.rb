# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'df1172d2bda169a00561957e0f023b15'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  before_filter :set_locale

  def set_locale
    # update session if passed
    session[:locale] = params[:locale] if params[:locale]

    # set locale based on session or default
    I18n.locale = session[:locale] || I18n.default_locale

    # load locale from settings
    @locale_files = []
    ['yml', 'rb'].each do |type|
      locale_file = "#{LOCALES_DIRECTORY}#{I18n.locale}.#{type}"
      if File.exists?(locale_file)
        @locale_files << locale_file
        I18n.load_translations locale_file
      end
    end
    Searchgasm::Config.configure do |config|
      config.page_links_next = "#{I18n.t(:next_page, :default => 'Next', :scope => [:railties, :scaffold])} &gt;"
      config.page_links_prev = "&lt; #{I18n.t(:prev_page, :default => 'Prev', :scope => [:railties, :scaffold])}"
      config.per_page_show_all_text = I18n.t(:all, :default => 'Show all', :scope => [:railties, :scaffold])
      config.per_page_text = "%s"
    end
  end
end
