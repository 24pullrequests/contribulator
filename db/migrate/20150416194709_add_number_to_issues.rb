class AddNumberToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :number, :integer
  end
end
