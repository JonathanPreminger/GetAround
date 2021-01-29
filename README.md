
1 - Initialization
Please download the repo, cd inside, bundle, rails db:create db:migrate db:seed. 

2 - User profil
the model user is generate with devise, once signed_in, after click on the link profil, the user 
can access to his profil where he can find all his registrated cars, and his rents list.
At the same spot he can add a car to the app. 

3 - Cars index 
All cars are listed here, in the link "cars" on the left of the navbar.
To rent one please select your start date and end date of rent in the form.
Choose a range anywhere in 2021 to access to all cars, and a range in 2025 will give only one car, accordingly to the seed.

4 - The search form
The logic of the code was move from the cars_controller to a dedicate module
The search form prevent the user to enter a date in the past, to enter a start_rent date after a end_rent date.
After those first check, the search method check all car available to the two date wanted.

One unavoilable feature would be to check if no one rent the car on the same period.

5 - The price
The price is define just before the creation with a callbacks.
The price is based on two components, the price by day and the price by km.
The logic of this code is, for the moment, in the rent model. But if things getting complex, 
it would be relevant to move all the price logic in a dedicate module.

6 - Validations
All model have validations, in order to have safe record in database. 
For example, the rent model have validation on price per km et price per day, 
without what the app couldn't calculate the very price.

7 - Relations 
The user model has many cars.
The rent model is a joint table between user and cars. 
So both of them had many rents and a rent belongs to one user and a car at the same time.

8 - Nested attributes
The nested attributes allow us to use some nested form in order to create a child in a parent form.
This reduce the number of view, action and even controller. We didn't resort to a rent controller.

9 - Rspec 
For the next commit

end


