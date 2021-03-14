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
     has_many :route_members
     has_many :routes, through: :route_members
     @@iconcolormgr

   def self.setIconColorMgr(col)
     @@iconcolormgr=col
     self
   end


   def self.iconColorMgr()
     @@iconcolormgr
   end

   def most_recent_actiontype
     self.actiontypes.order("created_at DESC").first
   end

   def latitude
     self.location.latitude if !self.location.nil?
   end
   def longitude
     self.location.longitude if !self.location.nil?
   end

   def routeposition
     res=""
     res=self.route_members.first.position.to_s if Entity.iconColorMgr=='route' and !self.route_members.empty?
     res
   end
   # Return iconcolor green if recent activity and red if not active
   #
   # @return [String] the color as a string
   def iconcolor   #NEED TO FIX ROUTE CODE COLORS
     mycolor="red"
     mycolor="green" if Entity.iconColorMgr=='normal' and !self.actiontypes.empty? and self.actiontypes.order('created_at DESC').limit(1).first.recent_activity
     mycolor="green" if Entity.iconColorMgr=='collection'
     if Entity.iconColorMgr=='route'
       mycolor="blue" if self.routes.first==Route.first
       mycolor="yellow" if  self.routes.last==Route.last
     end
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
     def svg_base_qrcode(actionurl)
       host = "#{SETTINGS.host}#{SETTINGS.port}/";  # change to support hostname in Settings
       finalurl = "#{host}#{actionurl}?id=#{self.id}"
       qrcode = RQRCode::QRCode.new(finalurl)
       puts finalurl
       $stdout.flush
       svg = qrcode.as_svg(
         offset: 0,
         color: '000',
         shape_rendering: 'crispEdges',
         module_size: 6,
         standalone: true
       )
       svg
     end

    def svg_checkin_qrcode
        url = "v1/entities/checkin";
        #host = "https://recycle-qrcode.herokuapp.com/";  # change to support hostname in Settings
        #host = "#{Setting.first.host}#{Setting.first.port}/";  # change to support hostname in Settings

        svg_base_qrcode(url)
    end

    def svg_update_location_qrcode
        url = "v1/entities/update_location";
        #host = "https://recycle-qrcode.herokuapp.com/";  # change to support hostname in Settings
        #host = "#{Setting.first.host}#{Setting.first.port}/";  # change to support hostname in Settings
      
        svg_base_qrcode(url)
    end
end
