class AddVideoToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :video_file_name, :string
    add_column :projects, :video_content_type, :string
    add_column :projects, :video_file_size, :integer
    add_column :projects, :video_updated_at, :datetime
  end
end
