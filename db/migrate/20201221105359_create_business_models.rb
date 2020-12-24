class CreateBusinessModels < ActiveRecord::Migration[6.0]
  def change
    create_table :business_models do |t|
      t.string :type_of_busness

      t.timestamps
    end
  end
end
