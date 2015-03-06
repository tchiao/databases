class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.string :status
      t.references :reader, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
