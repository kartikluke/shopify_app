# frozen_string_literal: true

class RootController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop

  def index
    @shop_orgin = current_shopify_domain
  end
end
