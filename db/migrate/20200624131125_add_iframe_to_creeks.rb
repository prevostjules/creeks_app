class AddIframeToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :iframe, :string
  end
end
