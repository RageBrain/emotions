class CreateStatistics < ActiveRecord::Migration[5.0]
  def change
    create_table :statistics do |t|
      t.float :anger
      t.float :fear
      t.float :disgust
      t.float :contemp
      t.float :joy
      t.float :sadness
      t.float :surprise
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
