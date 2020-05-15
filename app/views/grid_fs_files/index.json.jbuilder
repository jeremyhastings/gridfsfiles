# json.array! @grid_fs_files, partial: "grid_fs_files/grid_fs_file", as: :grid_fs_file
# TODO: Fix This
json.extract! grid_fs_file, :id, :filename, :contentType, :author, :topic, :uploadDate, :length, :chunkSize, :md5