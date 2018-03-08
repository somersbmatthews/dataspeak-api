class CreateHoldings < ActiveRecord::Migration[5.1]
  def change
    create_table :holdings do |t|
      t.integer :portfolio_id
      t.string :symbol
      t.integer :num_shares

      t.timestamps
    end
  end
end
