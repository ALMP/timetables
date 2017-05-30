class AddUniqueCodeToEmployee < ActiveRecord::Migration[5.0]
    def change
      add_index :employees, :code, unique: true
  end
end
