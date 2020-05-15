json.extract! grid_fs_file, :id, :filename, :contentType, :author, :topic, :uploadDate, :length, :chunkSize, :md5, :contents, :created_at, :updated_at
json.url grid_fs_file_url(grid_fs_file, format: :json)
