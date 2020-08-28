class RemoveTitleFromMemos < ActiveRecord::Migration[6.0]
  def change
    remove_column :memos, :title, :string
  end
end
