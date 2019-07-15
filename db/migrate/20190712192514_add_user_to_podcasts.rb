class AddUserToPodcasts < ActiveRecord::Migration[5.2]
  def change
    add_reference :podcasts, :user, foreign_key: true
  end
end
