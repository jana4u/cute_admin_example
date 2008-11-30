I18n.default_locale = 'en'

LOCALES_AVAILABLE = Dir["#{RAILS_ROOT}/config/locales/*.{rb,yml}"].collect do |locale_file|
  File.basename(File.basename(locale_file, ".rb"), ".yml")
end.uniq.sort
