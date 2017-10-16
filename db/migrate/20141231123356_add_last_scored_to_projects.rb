class AddLastScoredToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :last_scored, :timestamp
  end
end
