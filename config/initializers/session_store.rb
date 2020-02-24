Rails.application.config.session_store :cookie_store,
  key: "_any_cable_session",
  domain: :all,
  tld_length: 2
