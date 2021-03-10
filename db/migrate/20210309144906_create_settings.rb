class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings, id: :uuid do |t|
      t.string :host
      t.string :port
      t.float :centerlat
      t.float :centerlong
      t.float :zoom

      t.timestamps
    end
     setting=Setting.new
     setting.host="https://recycle-qrcode.herokuapp.com"
     setting.port=""
     setting.centerlat= -8.5569
     setting.centerlong= 125.5603
     setting.zoom=12
     setting.save
  end
end
