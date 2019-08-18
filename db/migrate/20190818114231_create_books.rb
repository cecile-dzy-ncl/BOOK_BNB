class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :author_fn
      t.string :author_ln
      t.string :title
      t.string :publishing
      t.string :grade
      t.text :summary
      t.string :status
      t.string :photo
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
