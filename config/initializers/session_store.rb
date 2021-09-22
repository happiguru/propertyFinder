if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key:
    '_propertyFinder', domain: 'http://127.0.0.1:3000/api/v1/'
else
    Rails.application.config.session_store :cookie_store, key: '_propertyFinder'
end
