class AddIndexesToProjects < ActiveRecord::Migration[5.1]
  def change
    add_index :projects, :score
    add_index :projects, 'lower(name)', name: 'index_projects_on_lower_name'
    add_index :projects, 'lower(owner)', name: 'index_projects_on_lower_owner'
    add_index :projects, 'lower(main_language)', name: 'index_projects_on_lower_main_language'
    add_index :projects, 'date(last_scored)', name: 'index_projects_on_date_last_scored'


    
  end
end
