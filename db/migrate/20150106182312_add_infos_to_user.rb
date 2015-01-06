class AddInfosToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :birthday, :string
    add_column :users, :description, :string
    add_column :users, :city, :string
    add_column :users, :longitude, :decimal, precision: 10, scale: 6
    add_column :users, :latitude, :decimal, precision: 10, scale: 6
  end
end
