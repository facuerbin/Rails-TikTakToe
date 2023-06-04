class CreateGames < ActiveRecord::Migration[7.0]
    def change
      create_table :games do |t|
        t.string :player1_id
        t.string :player2_id
        t.string :board
        t.integer :turn
        t.string :movements
        t.string :result
  
        t.timestamps
      end
    end
  end