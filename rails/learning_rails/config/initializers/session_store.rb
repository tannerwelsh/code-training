# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_learning_rails_session',
  :secret      => '82b40659d00de435f489f8dc387081829a48ac8a2f6ab70a211d86c2e07b4107b0f28c86eb86bc8db1c962fbf492a0b09a8cb777e018e267981f0356eb9990c0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
