class ChangeMedicalCoditionDataTypeInProfile < ActiveRecord::Migration[5.0]
  def change
  	rename_column :profiles, :medical_condition_id, :medical_condition
  	change_column :profiles, :medical_condition, :string
  end
end
