class Tune < ActiveRecord::Base

  belongs_to :user

  # Overerite the as_json method to change the output included of the
  # @instance.to_json call
  def as_json(options={})
    {
      id: id,
      title: title,
      artist: artist,
      url: url,
      comments: comments
    }
  end

end
