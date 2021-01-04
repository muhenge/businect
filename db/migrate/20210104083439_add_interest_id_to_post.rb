class AddInterestIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :interest_id, :integer
  end
end
