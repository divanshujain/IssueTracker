class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :body
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
