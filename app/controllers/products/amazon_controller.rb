class Products::AmazonController < ApplicationController
  def search
    @keyword = params[:keyword].to_s
    # TODO: デフォルトでnanoblockとつけるのが良いか悪いか悩む所
    @keyword += ' nanoblock'
    @res = Amazon::Ecs.item_search(
      @keyword,
      :type => 'title',
      :search_index   => 'Hobbies',
      :country        => 'jp',
      :response_group => 'Large'
    )
  end
  
  def create
    @product = create_product
    pp @product
  end
  
  private
  def create_product
    asin = params[:asin]
    item = lookup_item(asin)
    product = Product.find_or_create_by!(asin: asin) do |p|
      p.name = item.get('ItemAttributes/Title')
      p.image_url = item.get('LargeImage/URL')
      pp p
    end
    product
  end

  # TODO: model?
  def lookup_item(asin)
    resource = Amazon::Ecs.item_lookup(
      asin,
      {
        :country => 'jp',
        :response_group => 'Accessories,Images,ItemAttributes'
      },
    )
    if resource.items.length != 1
      raise # TODO:erro message
    end
    resource.items.shift
  end

end
