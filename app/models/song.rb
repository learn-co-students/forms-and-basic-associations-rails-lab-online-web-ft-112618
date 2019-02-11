class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes_array)
    notes_array.each do |note_string|
      self.notes.build(content: note_string) unless note_string.strip == ""
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end
end
