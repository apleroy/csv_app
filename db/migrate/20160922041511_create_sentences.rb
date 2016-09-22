class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :input

      t.timestamps null: false
    end
  end
end
