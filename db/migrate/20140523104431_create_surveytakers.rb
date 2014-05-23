class CreateSurveytakers < ActiveRecord::Migration
  def change
    create_table :surveytakers do |t|
      t.integer :user_id
      t.integer :survey_id

      t.timestamps
  end
end
