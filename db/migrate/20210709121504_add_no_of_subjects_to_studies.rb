class AddNoOfSubjectsToStudies < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :no_of_subjects, :integer,default: 0
  end
end
