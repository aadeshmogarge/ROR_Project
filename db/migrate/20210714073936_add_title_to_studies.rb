class AddTitleToStudies < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :title, :string
  end
end
