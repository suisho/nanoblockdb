# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Nanoblockdb::Application.initialize!

# Amazon ECS setting
Amazon::Ecs.options = {
  :associate_tag     => ENV['AMAZON_ASSOCIATE_TAG'],
  :AWS_access_key_id => ENV['AMAZON_ECS_ACCESS_KEY_ID'],
  :AWS_secret_key    => ENV['AMAZON_ECS_SECRET_KEY']
}
Amazon::Ecs.debug = true if Rails.env.development?