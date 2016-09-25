#!/usr/bin/env ruby

require './lib/broadcaster'
require './lib/delivery'
require './lib/material'
require './lib/order'
require './lib/price_discount'
require './lib/delivery_discount'

standard_delivery = Delivery.new(:standard, 10.0)
express_delivery = Delivery.new(:express, 20.0)

broadcaster_1 = Broadcaster.new(1, 'Viacom')
broadcaster_2 = Broadcaster.new(2, 'Disney')
broadcaster_3 = Broadcaster.new(3, 'Discovery')
broadcaster_4 = Broadcaster.new(4, 'ITV')
broadcaster_5 = Broadcaster.new(5, 'Channel 4')
broadcaster_6 = Broadcaster.new(6, 'Bike Channel')
broadcaster_7 = Broadcaster.new(7, 'Horse and Country')

material = Material.new('WNP/SWCL001/010')

price_discount = PriceDiscount.new(30, 10)
delivery_discount = DeliveryDiscount.new(:express, 15, 2)

order = Order.new(material, delivery_discount, price_discount)

#order.add broadcaster_1, standard_delivery
#order.add  broadcaster_2, standard_delivery
#order.add broadcaster_5, standard_delivery
order.add broadcaster_3, express_delivery
order.add broadcaster_3, express_delivery
order.add broadcaster_3, express_delivery

print order.total
print "\n"
