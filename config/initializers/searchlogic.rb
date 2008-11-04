Searchlogic::Config.configure do |config|
  config.search.per_page = 50
  config.helpers.page_link_class_name = ""
  config.helpers.page_links_first_page_class_name = "first"
  config.helpers.page_links_last_page_class_name = "last"
  config.helpers.page_links_next_page_class_name = "next"
  config.helpers.page_links_prev_page_class_name = "prev"
  config.helpers.page_links_current_page_class_name = "current"
  config.helpers.page_links_disabled_class_name = "disabled"
end
