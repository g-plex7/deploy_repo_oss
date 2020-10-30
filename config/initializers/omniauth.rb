
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, 'ecef470978c7354234d3', '1e38f559d599e2332b0ced0b5c93e5fe8dc125c7', :scope => 'user:email, repo'
end 