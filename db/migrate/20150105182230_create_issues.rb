class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.integer :github_id, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.string :state
      t.integer :comments, default: 0
      t.timestamp :closed_at
      t.text :body

      t.integer :project_id, null: false

      t.timestamps null: false
    end
  end
end

