# frozen_string_literal: true

require 'rails/generators/base'

module ShopifyApp
  module Generators
    class RootControllerGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_root_controller
        template('root_controller.rb', 'app/controllers/root_controller.rb')
      end

      def add_root_index_route
        route("root :to => 'root#index'")
      end

      def embedded_app?
        ShopifyApp.configuration.embedded_app?
      end
    end
  end
end
