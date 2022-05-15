class AddCommunityRefToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :submissions, :community, null: false, foreign_key: true
  end
end
