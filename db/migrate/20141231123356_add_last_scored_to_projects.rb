class AddLastScoredToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :last_scored, :timestamp
  end
end
