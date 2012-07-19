class ChangeOutcomesPreconditionsDescriptionScenariosTitleToText < ActiveRecord::Migration
  def self.up
    change_column :outcomes,      :description, :text
    change_column :preconditions, :description, :text
    change_column :scenarios,     :title,       :text
  end

  def self.down
    change_column :outcomes,      :description, :string
    change_column :preconditions, :description, :string
    change_column :scenarios,     :title,       :string
  end
end
