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

  def initialize(params={})
    if params[:_id] # Hash came from GridFS
      @id = params[:_id].to_s
      @author = params[:metadata].nil? ? nil : params[:metadata][:author]
      @topic = params[:metadata].nil? ? nil : params[:metadata][:topic]
    else # Assume hash came from Rails
      @id = params[:id]
      @author = params[:author]
      @topic = params[:topic]
    end
    @chunkSize = params[:chunkSize]
    @uploadDate = params[:uploadDate]
    @contentType = params[:contentType]
    @filename = params[:filename]
    @length = params[:length]
    @md5 = params[:md5]
    @contents = params[:contents]
  end

end