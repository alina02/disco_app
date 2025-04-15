module DiscoApp
  class SessionStorage

    def self.store(session, *args)
      shop = Shop.find_or_initialize_by(shopify_domain: session.shop)
      shop.shopify_token = session.token
      shop.save!
      shop.id
    end

    def self.retrieve(id)
      return unless id

      shop = Shop.find(id)
      ShopifyAPI::Auth::Session.new(shop: shop.shopify_domain, access_token: shop.shopify_token)
    rescue ActiveRecord::RecordNotFound
      nil
    end

    def self.retrieve_by_shopify_domain(shopify_domain)
      Rails.logger.info("-----------------------Shopify Domain---------------\n #{shopify_domain}\n-----------")
      shop = Shop.find_by(shopify_domain: shopify_domain)
      ShopifyAPI::Auth::Session.new(shop: shop.shopify_domain, access_token: shop.shopify_token)
    end

    def self.destroy_by_shopify_domain(shopify_domain)
      destroy_by(shopify_domain: shopify_domain)
    end
  end
end
