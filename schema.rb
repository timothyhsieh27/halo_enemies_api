require_relative 'environment'

class CreateEnemiesTable < ActiveRecord::Migration[5.0]

  def up
    create_table :enemies do |enemy|
      enemy.string :name
      enemy.string :species
    end
  end

  def down
    drop_table :enemies
  end

end

def main
  action = (ARGV[0] || :up).to_sym

  CreateEnemiesTable.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
