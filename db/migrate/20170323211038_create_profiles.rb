# frozen_string_literal: true
class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :gender

      t.timestamps
    end
  end
end
