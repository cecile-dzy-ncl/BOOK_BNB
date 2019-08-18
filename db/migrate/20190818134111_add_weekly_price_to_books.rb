class AddWeeklyPriceToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :weekly_price, :float
  end
end
