class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string  :title
      t.integer :user_id
      t.integer :option_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
