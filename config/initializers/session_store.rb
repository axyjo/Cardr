# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_new_cardr_session',
  :secret      => '9db2a8022ac454929382ca77f9693863432f949f967ea6d7e681ac8196fd83b891daa7e77490e19cc7b2748c445a45b6c38e0415d46a16eba374c2d41c3646ee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
