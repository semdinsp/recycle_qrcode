# Entity is the key datastructure in the system.
# We store the bin as an entity and link actiontypes to it to reflect actions on the entity
#
# @author Scott Sproule

class Entity < ApplicationRecord
     enum etype: [  :bin, :garage ]
     enum status: [  :active, :deleted ]
  #   has_one :location, required: false
     has_one :location, as: :locatable
     has_many :actiontypes
     has_many :kv_pairs
     has_many :routes, through: :route_member

   # Return iconcolor green if recent activity and red if not active
   #
   # @return [String] the color as a string
   def iconcolor
     mycolor="red"
     mycolor="green" if !self.actiontypes.empty? and self.actiontypes.order('created_at DESC').limit(1).first.recent_activity
    # "green"  # green if recent action
    # "red"   # red if no recent
     mycolor
   end
   def kv_extract(key)
     return '' if self.kv_pairs.empty?
     #self.kv_pairs.send(key.to_sym).value
   end
   def contactName
     self.kv_pairs.contact.first.value if  !self.kv_pairs.contact.empty?  and !self.kv_pairs.contact.nil?
   end
   def suco
     self.kv_pairs.suco.first.value if !self.kv_pairs.empty? and !self.kv_pairs.suco.empty?  and !self.kv_pairs.suco.nil?
   end
   def notes
     self.kv_pairs.notes.first.value if !self.kv_pairs.empty? and !self.kv_pairs.notes.empty? and !self.kv_pairs.notes.nil?
   end
   def telephone
     self.kv_pairs.telephone.first.value if !self.kv_pairs.empty? and !self.kv_pairs.telephone.empty?  and !self.kv_pairs.telephone.nil?
   end


    def svg_checkin_qrcode
        url = "v1/entities/checkin";
        host = "https://recycle-qrcode.herokuapp.com/";  # change to support hostname in Settings
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
