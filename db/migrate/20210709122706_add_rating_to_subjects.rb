class AddRatingToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :rating, :string
  end
end
