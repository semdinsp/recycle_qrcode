class Entity < ApplicationRecord
     enum etype: [ :bin, :garage ]
     enum status: [ :active, :deleted ]

end
