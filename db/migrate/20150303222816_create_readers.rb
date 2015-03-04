class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :name
      t.string :age
      t.string :gender

      t.timestamps
    end
  end
end
