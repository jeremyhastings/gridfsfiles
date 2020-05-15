class GridFsFile
  include ActiveModel::Model
  attr_accessor :id

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