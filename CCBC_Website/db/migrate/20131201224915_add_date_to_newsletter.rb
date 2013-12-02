class AddDateToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :date, :date
  end
end
