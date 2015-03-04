class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.references :reader, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
