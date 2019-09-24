class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # def category_name=(name)
  #   self.category = Category.find_or_create_by(name: name)
  # end
 
  # def category_name
  #    self.category ? self.category.name : nil
  # end

  
  def genre_name=(name)
    #sets the genre to the genre of the specified name
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    #returns the genre name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    #sets the artist to the artist of the specified name
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    #returns the artist name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    #sets notes for a song
    #adds to existing notes
    #ignores blank notes
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    #returns the content of all notes as an array
    self.notes.map {|note| note.content}
  end

end
