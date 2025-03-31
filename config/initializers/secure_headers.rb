SecureHeaders::Configuration.default do |config|
  # config.hsts = "max-age=31536000; includeSubDomains; preload"
  config.x_frame_options = "DENY"
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = "1; mode=block"
  config.referrer_policy = "strict-origin-when-cross-origin"

  # config.csp = {
  #   default_src: ["'self'"],
  #   script_src: ["'self'", "https:"],
  #   style_src: ["'self'", "https:", "'unsafe-inline'"],
  #   img_src: ["'self'", "https:", "data:"],
  #   font_src: ["'self'", "https:", "data:"],
  #   object_src: ["'none'"],
  #   frame_ancestors: ["'none'"],
  #   upgrade_insecure_requests: true, # HTTPリクエストをHTTPSにアップグレード
  #   policy_directives: {
  #     "permissions-policy" => "accelerometer=(), camera=(), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), payment=(), usb=()"
  #   }
  # }
end
