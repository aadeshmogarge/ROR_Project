class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|

      t.references :study, null: false, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
