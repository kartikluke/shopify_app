# frozen_string_literal: true
require 'test_helper'
require 'generators/shopify_app/root_controller/root_controller_generator'

class RootControllerGeneratorTest < Rails::Generators::TestCase
  tests ShopifyApp::Generators::RootControllerGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))

  setup do
    ShopifyApp.configure do |config|
      config.embedded_app = true
    end

    prepare_destination
    provide_existing_application_file
    provide_existing_routes_file
    provide_existing_application_controller
  end

  test "creates the root controller" do
    run_generator
    assert_file "app/controllers/root_controller.rb"
  end

  test "adds root route to routes" do
    run_generator
    assert_file "config/routes.rb" do |routes|
      assert_match "mount ShopifyApp::Engine, at: '/'", routes
      assert_match "root :to => 'root#index'", routes
    end
  end
end
