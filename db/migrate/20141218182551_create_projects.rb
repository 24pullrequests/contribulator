class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :owner
      t.string :homepage
      t.string :main_language
      t.integer :github_id
      t.boolean :fork, default: false
      t.float :score, default: 0
      t.text :description
    end
  end
end
