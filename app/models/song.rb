class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    self.genre = genre
  end
  
  def genre_name
    self.genre.name
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.find_or_create_by(content: content)
        self.notes.push(note)
      end
    end
  end
  
  def note_contents
    self.notes.map(&:content)
  end
end
