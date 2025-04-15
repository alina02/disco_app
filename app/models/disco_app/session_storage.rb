module DiscoApp
  class SessionStorage

    def self.store(session, *args)
      shop = Shop.find_or_initialize_by(shopify_domain: session.url)
      shop.shopify_token = session.token
      shop.save!
      shop.id
    end

    def self.retrieve(id)
      return unless id

      shop = Shop.find(id)
      ShopifyAPI::Session.new(domain: shop.shopify_domain, token: shop.shopify_token, api_version: shop.api_version)
    rescue ActiveRecord::RecordNotFound
      nil
    end

    def self.retrieve_by_shopify_domain(shopify_domain)
      shop = Shop.find_by(shopify_domain: shopify_domain)
      ShopifyAPI::Session.new(domain: shop.shopify_domain, token: shop.shopify_token, api_version: shop.api_version)
    end

    def self.destroy_by_shopify_domain(shopify_domain)
      destroy_by(shopify_domain: shopify_domain)
    end
  end
end
