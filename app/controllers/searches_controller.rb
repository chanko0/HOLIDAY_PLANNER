class SearchesController < ApplicationController

  def search
    @post_searches = Post.search(params[:keyword])
    @keyword = params[:keyword]
    @posts = Post.page(params[:page]).reverse_order
  end

end
