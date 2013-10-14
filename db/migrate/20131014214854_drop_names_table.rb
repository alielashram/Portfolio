class DropNamesTable < ActiveRecord::Migration
  def up
    drop_table :names
  end

  def down
  end
end
