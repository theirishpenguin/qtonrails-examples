# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails_qt_cart_session',
  :secret      => 'fb303b2f28efdf7ef4fb913bcf802c6a25be845d759b64a5aa3a8a4a53a6ed25b3dcbf56e0f3e9ab86035b3e4a17643cdae3efa6b312415c33967257f1b06202'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
