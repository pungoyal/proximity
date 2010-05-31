# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_proximity_session',
  :secret      => '62b15888c69cc14b2f91a3a94dad4cb0736ad4405ba18d51771e2b35f17f74e339f4cf5f87502b698d1b21125acbaa92aa1733357a44c59e309da8b6769b1417'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
