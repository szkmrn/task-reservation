class AddPersonToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :person, :integer
  end
end
