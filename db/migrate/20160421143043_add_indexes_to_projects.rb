class AddIndexesToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.index :score
      t.index expression: 'lower(name)', name: 'index_projects_on_lower_name'
      t.index expression: 'lower(owner)', name: 'index_projects_on_lower_owner'
      t.index expression: 'lower(main_language)', name: 'index_projects_on_lower_main_language'
      t.index expression: 'date(last_scored)', name: 'index_projects_on_date_last_scored'
    end
  end
end
