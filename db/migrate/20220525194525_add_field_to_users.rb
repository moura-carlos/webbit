class AddFieldToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :card_exp_year, :integer
  end
end
