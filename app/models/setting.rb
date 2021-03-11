# Settings class for various items like map center and zoom
# this needs to be  a singleton and you should only create one.
# The syste makes an attempt to only allow one (eg no create in admin dashboard)
# but it is not hard to override
# System takes first settings and sets a class varaible in environment.rb 

class Setting < ApplicationRecord

end
