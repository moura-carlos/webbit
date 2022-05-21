class AddCommentSubscriptionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :comment_subscription, :boolean, default: true
  end
end
