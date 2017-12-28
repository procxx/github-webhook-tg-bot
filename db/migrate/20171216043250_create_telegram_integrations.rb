class CreateTelegramIntegrations < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_integrations do |t|
      t.string :integration_key
      t.integer :channel_id
      t.timestamps
    end

    add_index :telegram_integrations, :integration_key
  end
end
