require 'test_helper'

class GridFsFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grid_fs_file = grid_fs_files(:one)
  end

  test "should get index" do
    get grid_fs_files_url
    assert_response :success
  end

  test "should get new" do
    get new_grid_fs_file_url
    assert_response :success
  end

  test "should create grid_fs_file" do
    assert_difference('GridFsFile.count') do
      post grid_fs_files_url, params: { grid_fs_file: { author: @grid_fs_file.author, chunkSize: @grid_fs_file.chunkSize, contentType: @grid_fs_file.contentType, contents: @grid_fs_file.contents, filename: @grid_fs_file.filename, length: @grid_fs_file.length, md5: @grid_fs_file.md5, topic: @grid_fs_file.topic, uploadDate: @grid_fs_file.uploadDate } }
    end

    assert_redirected_to grid_fs_file_url(GridFsFile.last)
  end

  test "should show grid_fs_file" do
    get grid_fs_file_url(@grid_fs_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_grid_fs_file_url(@grid_fs_file)
    assert_response :success
  end

  test "should update grid_fs_file" do
    patch grid_fs_file_url(@grid_fs_file), params: { grid_fs_file: { author: @grid_fs_file.author, chunkSize: @grid_fs_file.chunkSize, contentType: @grid_fs_file.contentType, contents: @grid_fs_file.contents, filename: @grid_fs_file.filename, length: @grid_fs_file.length, md5: @grid_fs_file.md5, topic: @grid_fs_file.topic, uploadDate: @grid_fs_file.uploadDate } }
    assert_redirected_to grid_fs_file_url(@grid_fs_file)
  end

  test "should destroy grid_fs_file" do
    assert_difference('GridFsFile.count', -1) do
      delete grid_fs_file_url(@grid_fs_file)
    end

    assert_redirected_to grid_fs_files_url
  end
end
