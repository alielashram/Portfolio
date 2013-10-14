class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :technologies_used

      t.timestamps
    end
  end
end
