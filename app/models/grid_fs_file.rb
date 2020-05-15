class GridFsFile
  include ActiveModel::Model
  attr_accessor :contentType, :filename, :author, :topic
  attr_writer :contents
  attr_reader :id, uploadDate, :chunkSize, :length, :md5

  def persisted?
    !@id.nil?
  end

  def created_at
    nil
  end

  def updated_at
    nil
  end

end