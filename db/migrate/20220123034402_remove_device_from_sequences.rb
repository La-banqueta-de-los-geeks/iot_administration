class RemoveDeviceFromSequences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :device_sequences, :device
    add_reference :device_sequences, :device_group
  end
end
