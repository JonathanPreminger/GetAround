
1 - Initialization
Please download the repo, cd inside, bundle, rails db:create db:migrate db:seed. 

2 - User profil
The User model is generate with devise, once signed_in, after click on the link profil, the user 
can access to his profil where he can find all his registrated cars, and his rents list.
At the same spot he can add a car to the app. 

3 - Cars index 
All cars are listed here, in the link "cars" on the left of the navbar.
To rent one please select your start date and end date of rent in the form.
A rent search between the 22 march 2021 and 24 march 2021 must give no car accordingly to the seed, 
(the two car available for this period are already rented).
A rent search in february 2021 must give 2 car accordingly to the seed, 
(two car are available for this period and none is rented).
A rent search in 2025 must give 1 car accordingly to the seed, 
(only one car is available for this period and it's not rented).

4 - The search form
The logic of the code was move from the cars_controller to a dedicated module
The search form prevent the user to enter a date in the past, and to enter a start_rent date after a end_rent date.
After those first check, the search method check all cars available to the two date wanted.
Then it check if those available cars are already rent on this period, and display in the same view the result.
All overlapping range dates are also predict in the code to avoid a double location on a same period.

5 - The price of the rent
The price and the commission part is define just before the creation with a callbacks before_action, 
The price is based on two components, the price by day and the price by km.
The logic of this code is, for the moment, in the rent model. But if things getting complex, 
it would be relevant to move all the price logic in a dedicate module or service.
Also it could be relevant to create dedicate model to the three commissions part.
All of the commissions are displayed in the rent card, this can be justified by a concern for transparency towards users, 
but it should be discuss with the product owner.

6 - Validations
All model have validations, in order to have safe record in database. 
For example, the Rent model have validations on price per km, price per day among others, 
without what the app couldn't calculate the price of the rent.

7 - Relations 
The User model has many cars.
The Rent model is a joint table between user and cars. 
So both of them had many rents and a rent belongs to a user and a car at the same time.

8 - Nested attributes
The nested attributes allow us to use some nested form in order to create a child in a parent form.
This reduce the number of view, action and even controller. We didn't resort to a rent controller for example.

9 - Rspec 
The Rspec gem was used to test two models. 
On the Rent model, callbacks filter method's relative to price and commissions are tested.
The gem shoulda matcher was used to test validation, columns type and relations on the Car model.

Thank you for your attention

Jonathan Mete


