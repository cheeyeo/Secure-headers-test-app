::SecureHeaders::Configuration.configure do |config|
  config.hsts = {:max_age => 20.years.to_i, :include_subdomains => true}
  config.x_frame_options = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = {:value => 1, :mode => 'block'}
  config.x_download_options = 'noopen'
  config.x_permitted_cross_domain_policies = 'none'
  config.csp = {
    :default_src => "self",
    :script_src => "self nonce",
    :img_src => "self",
    :frame_src => "https: https://platform.twitter.com",
    :tag_report_uri => true,
    :enforce => true,
    :app_name => Rails.application.class.to_s.split("::").first,
    :report_uri => '/csp_reports'
  }
end
