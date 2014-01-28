class Products::AmazonController < ApplicationController
  def search
    @keyword = params[:keyword].to_s
    # TODO: デフォルトでnanoblockとつけるのが良いか悪いか悩む所
    @keyword += ' nanoblock'
    @res = Amazon::Ecs.item_search(
      @keyword,
      :search_index   => 'Hobbies',
      :country        => 'jp',
      :response_group => 'Large'
    )
  end

  def create
  end

end
