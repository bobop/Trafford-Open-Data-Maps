# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_traffordopendata_session',
  :secret      => '4c1f47c767e322c4b470285f622d6b66f633bd93efaa0a38e2b120d73348e5e16372ee838c97fb63e7508dcc9b045cd359eec1388bffc4df28a06158062e0dd6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
