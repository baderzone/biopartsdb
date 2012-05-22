Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :openid, :name => 'myopenid', :identifier => 'myopenid.com'
  provider :openid, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end
