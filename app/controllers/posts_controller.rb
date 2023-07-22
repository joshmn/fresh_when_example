class PostsController < ApplicationController
  def index
    @posts = Post.all

    fresh_when last_modified: @posts.maximum(:updated_at), etag: @posts.map(&:id)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create!

    redirect_to posts_path
  end
end
