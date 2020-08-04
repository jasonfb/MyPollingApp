class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :random_seconds
      t.datetime :finished_at

      t.timestamps
    end
  end
end
