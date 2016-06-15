class AddAttachmentColumnToGuests < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :guests, :picture
  end
end
