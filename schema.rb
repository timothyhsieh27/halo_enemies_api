require_relative 'environment'

class CreateWeaponsTable < ActiveRecord::Migration[5.0]

  def up
    create_table :weapons do |weapon|
      weapon.string :name
      weapon.string :type
    end
  end

  def down
    drop_table :weapons
  end

end

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

class CreateConfigurationsTable < ActiveRecord::Migration[5.0]

  def up
    create_join_table :configurations 
  end

  def down
    drop_join_table :weapons, :enemies
  end

end

def main
  action = (ARGV[0] || :up).to_sym

  CreateWeaponsTable.migrate(action)
  CreateEnemiesTable.migrate(action)
  CreateConfigurationsTable.migrate(action)

end

main if __FILE__ == $PROGRAM_NAME
