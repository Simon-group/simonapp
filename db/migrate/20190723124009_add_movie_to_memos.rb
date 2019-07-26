class AddMovieToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :movie, :string
  end
end
