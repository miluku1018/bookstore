class AddPublisherIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :publisher, index: false
  end
end
