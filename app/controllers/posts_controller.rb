class PostsController < JSONAPI::ResourceController
  before_action :require_token, only: [:new, :create]

  def require_token
    raise JSONAPI::Exceptions::InvalidResource.new(:post) unless params[:token].eql?(Rails.configuration.x.blog.token)
  end
end
