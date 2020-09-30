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
-------
STUFF TO DO:

-IF MULTIPLE STORES: make it so that either
	a) manager has to be editing THEIR stores inventory
	b) lock it in on page



AHMED
-Store page: add button for new/edit inventory?
	-visible only to managers?
-Purchase: no more dropdown for user, locked in based on current login
	-quantity?
	-cart?

CONRAD
-Homepage (conrad wants to do this!)
	DONE-login/create user
	DONE-product directory
	DONE-store directory
	ALREADY DONE?-my user page
	-stretch: last/favorite purchase
	-manager? - is this just on store show page, or the ACTUAL homepage?
		-potentially render a different partial based on if you're manager or not
DONE-Header: make this a thing -- say username, login/logout, link to homepage, balance
DONE-Login: don't allow login/redirect if we're already logged in

BOTH


----
conrad notes:
DONE login/logout redirect back to last page?
DONE need purchase to, you know, actually deduct money from user








price change?
	-if we do do that, make sure a purchase records the price AT THE TIME
refund?
//////more than one store
-cart?? oof
	-instead of purchase, add to cart
	-button to go to cart page
	-cart page shows "QUANTITY ITEM - TOTAL PRICE" for each item
	-bottom button creates purchases for everything in cart
.....