class ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, record)
    @user = user
    @post = post
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.admin? or not post.published?
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

