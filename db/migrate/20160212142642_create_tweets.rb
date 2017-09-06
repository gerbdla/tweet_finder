class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet_text
      t.integer :user_id
      t.string :tweet_id
      t.timestamps null: false
    end
  end
end
