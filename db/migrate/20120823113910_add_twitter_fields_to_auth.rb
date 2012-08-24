class AddTwitterFieldsToAuth < ActiveRecord::Migration
  def change
  	add_column :authorizations, :secret, :string
  	add_column :authorizations, :token, :string
  	add_column :authorizations, :image, :string
  	add_column :authorizations, :nickname, :string

  end
end
