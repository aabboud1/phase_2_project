# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


ahmed:
form (purchase)
customer views (show, new, create) & controller actions


conrad:
product views (new, create) & controller actions




STUFF TO DO:
-should we do a link on product show page to purchase from the store that is listed?
-customer show page - duplicate purchases should just list amount, rather than show up twice
-create purchase error message
-product show page - specify store is sold out, if store is sold out
-user login, i.e. cookies
-able to purchase - i.e. do you have enough money?
-maybe give inventories an automatic name, idk
-make sure that when adding product to store, the "inventory" is either created or updated


PHASE 1/SKATEBOARD:
basic functionality:
	-Singular store show page shows products it has, quantity, and links to purchase page
	-Customer show page shows name, what they've purchased
	-Can create new customer, name must be unique (currently is only exact match)
	-New purchase page gives dropdown for customer/store/product, can take product/store parameters
	-Error messages if purchase isn't valid
	-Product index page shows all products, links to their show page
	-Product show page shows where it can be bought (only one store rn though!), as well as type & price


PHASE 2/SCOOTER:
adding money: (conrad)
	DONE-customer has a balance
	DONE-product has price
	-store has balance
	DONE-customer cannot buy item if they don't have enough money
store increasing inventory: (ahmed)
	DONE-from store page, manage inventory button?
	DONE-store can specify product & number they want to buy
	DONE-will increase their stock by however much
	-either creates a new inventory object, or updates an existing inventory object
other tasks: (both)
	-should we do a link on product show page to purchase from the store that is listed?
	DONE(each transaction has date)-customer show page - duplicate purchases should just list amount, rather than show up twice
	-create purchase error message
	-product show page - specify store is sold out, if store is sold out



TUES, 9/29:
---
CONRAD:
	-more purchase error message
	-cookie/session stuff
AHMED:
	-new vs. edit inventory
		-make sure there's validation for new inventory, ie if that already exists, throw error OR just have it update instead
	-debug store showing up multiple times on product page
	-debug product showing up multiple times on store page
BOTH?

NOTES FOR CONRAD:
-store linking id? ie when making user, can input a specific code to prove they are a store


PHASE 3:
user login/store login
price change?
	-if we do do that, make sure a purchase records the price AT THE TIME
refund?
.....

FINAL PHASE: