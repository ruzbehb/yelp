class AddColumnsToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :rating, :integer
    add_column :reviews, :body, :text
  end
end
