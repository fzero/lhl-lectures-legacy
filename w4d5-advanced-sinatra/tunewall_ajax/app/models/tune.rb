class Tune < ActiveRecord::Base

  belongs_to :user

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
