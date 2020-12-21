class AddBusmodelToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :busmodel, :string
  end
end
