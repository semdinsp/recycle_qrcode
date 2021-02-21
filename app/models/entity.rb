class Entity < ApplicationRecord
     enum etype: [  :bin, :garage ]
     enum status: [  :active, :deleted ]
     has_one :location, required: false
     has_many :actiontypes


    def svg_checkin_qrcode
        url = "v1/entities/checkin";
        host = "https://recycle-qrcode.herokuapp.com/";
        finalurl = "#{host}#{url}?id=#{self.id}"
        qrcode = RQRCode::QRCode.new(finalurl)
        svg = qrcode.as_svg(
          offset: 0,
          color: '000',
          shape_rendering: 'crispEdges',
          module_size: 6,
          standalone: true
        )
        svg
    end
end
