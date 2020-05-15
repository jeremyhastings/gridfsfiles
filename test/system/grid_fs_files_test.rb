require "application_system_test_case"

class GridFsFilesTest < ApplicationSystemTestCase
  setup do
    @grid_fs_file = grid_fs_files(:one)
  end

  test "visiting the index" do
    visit grid_fs_files_url
    assert_selector "h1", text: "Grid Fs Files"
  end

  test "creating a Grid fs file" do
    visit grid_fs_files_url
    click_on "New Grid Fs File"

    fill_in "Author", with: @grid_fs_file.author
    fill_in "Chunksize", with: @grid_fs_file.chunkSize
    fill_in "Contenttype", with: @grid_fs_file.contentType
    fill_in "Contents", with: @grid_fs_file.contents
    fill_in "Filename", with: @grid_fs_file.filename
    fill_in "Length", with: @grid_fs_file.length
    fill_in "Md5", with: @grid_fs_file.md5
    fill_in "Topic", with: @grid_fs_file.topic
    fill_in "Uploaddate", with: @grid_fs_file.uploadDate
    click_on "Create Grid fs file"

    assert_text "Grid fs file was successfully created"
    click_on "Back"
  end

  test "updating a Grid fs file" do
    visit grid_fs_files_url
    click_on "Edit", match: :first

    fill_in "Author", with: @grid_fs_file.author
    fill_in "Chunksize", with: @grid_fs_file.chunkSize
    fill_in "Contenttype", with: @grid_fs_file.contentType
    fill_in "Contents", with: @grid_fs_file.contents
    fill_in "Filename", with: @grid_fs_file.filename
    fill_in "Length", with: @grid_fs_file.length
    fill_in "Md5", with: @grid_fs_file.md5
    fill_in "Topic", with: @grid_fs_file.topic
    fill_in "Uploaddate", with: @grid_fs_file.uploadDate
    click_on "Update Grid fs file"

    assert_text "Grid fs file was successfully updated"
    click_on "Back"
  end

  test "destroying a Grid fs file" do
    visit grid_fs_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grid fs file was successfully destroyed"
  end
end
