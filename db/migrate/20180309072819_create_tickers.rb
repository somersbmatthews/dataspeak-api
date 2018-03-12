class CreateTickers < ActiveRecord::Migration[5.1]
  def change
    create_table :tickers do |t|
      t.string :ticker
      t.string :company_name

      t.timestamps
    end
  end
end
