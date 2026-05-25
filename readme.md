# Dependencies
- OX Inventory : https://github.com/overextended/ox_inventory
- OX LIB: https://github.com/overextended/ox_lib

* add to ox_inventory/data/items.lua 
* add image to ox_inventory/web/images

['steelfile'] = {
	label = 'Steel File',
	weight = 150,
	stack = false,
    consume = 0.1,
},

* Change the difficulty of the skillcheck in client/client.lua Line 29 
	- Options are easy, medium, hard 
	- Can also change the inputs to what you'd like.

# Credits
- https://github.com/KevinGirardx/kevin-weaponscratch