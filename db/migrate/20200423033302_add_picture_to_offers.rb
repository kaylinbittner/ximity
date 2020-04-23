class AddPictureToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :picture, :string
  end
end
