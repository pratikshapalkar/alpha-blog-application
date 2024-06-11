class ArticlePolicy < ApplicationPolicy
  attr_reader :article

  def initialize(user, article)
    @user = user
    @charger = article
  end

  def index?
    user.is_admin?
  end
end
