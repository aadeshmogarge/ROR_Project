class AddFeedbackToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :feedback, :integer
  end
end
