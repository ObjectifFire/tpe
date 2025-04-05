class CreateReductions < ActiveRecord::Migration[8.0]
  def change
    create_table :reductions do |t|
      t.decimal :amount
      t.boolean :avaiable, default: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
