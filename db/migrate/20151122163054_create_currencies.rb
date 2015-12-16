class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :currency
      t.string :currency_to

      t.timestamps null: false
    end
  end
end
