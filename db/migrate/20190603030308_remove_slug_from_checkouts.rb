class RemoveSlugFromCheckouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :checkouts, :slug, :string
  end
end
