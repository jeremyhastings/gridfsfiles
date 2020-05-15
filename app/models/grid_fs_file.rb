class GridFsFile
  include ActiveModel::Model
  attr_accessor :contentType, :filename, :author, :topic
  attr_writer :contents
  attr_reader :id, :uploadDate, :chunkSize, :length, :md5

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

  def self.mongo_client
    @@db ||= Mongoid::Clients.default
  end

  def save
    description = {}
    description[:filename] = @filename if !@filename.nil?
    description[:content_type] = @contentType if !@contentType.nil?
    if @author || @topic
      description[:metadata] = {}
      description[:metadata][:author] = @author if !@author.nil?
      description[:metadata][:topic] = @topic if !@topic.nil?
    end

    if @contents
      grid_file = Mongo::Grid::File.new(@contents.read, description)
      id = self.class.mongo_client.database.fs.insert_one(grid_file)
      @id = id.to_s
    end
  end

  def self.id_criteria id
    { _id:BSON::ObjectId.from_string(id) }
  end

  def id_criteria
    self.class.id_criteria @id
  end

  
end