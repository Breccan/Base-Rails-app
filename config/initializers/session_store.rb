# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_word_warrior_session',
  :secret      => '633fc21de98be160a2580192a7cfc2a5ee35a25cb5e3880a85f65194164b32f0e4380fde07b85b0c6cb4b188e5fff810dd5d88723796b4ecda4a39fd51f802a4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
