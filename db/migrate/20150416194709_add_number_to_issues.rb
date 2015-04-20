class AddNumberToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :number, :integer
  end
end
