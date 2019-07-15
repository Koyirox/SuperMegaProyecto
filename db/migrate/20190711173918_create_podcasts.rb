class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.boolean :paiduser
      t.string :duration

      t.timestamps
    end
  end
end
