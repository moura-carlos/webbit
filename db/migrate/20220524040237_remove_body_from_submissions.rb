class RemoveBodyFromSubmissions < ActiveRecord::Migration[6.1]
  def change
    remove_column :submissions, :body, :text
  end
end
