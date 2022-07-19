# Assignment recipes

You can see all the changes I have done with this assignment at [JITERA Assignments](https://github.com/trantuanckc/recipes/pull/4/files) and the detail is broken below

For the limited time of this assignment, I will try my best :D

---

## Run project by Docker

- Install docker: https://docs.docker.com/engine/install/
- Copy file .env.example to .env and replace the values if needed
- Go source folder and run following command to start docker: `docker-compose up`
- Wait until docker has installed all of the libraries and start _rails server_ successfully
- Open browser and go to: http://localhost:3000

## Import Postman API + Related Enviroments variables
- [Postman API - Assignment Recipes.zip](https://github.com/trantuanckc/recipes/files/9143382/Postman.API.-.Assignment.Recipes.zip)
<img width="1487" alt="image" src="https://user-images.githubusercontent.com/4193786/179812951-cdd0aa82-a8cf-497f-bf0f-e58f45813a57.png">


## Assignment Questions

### Question 1: We want to create the search recipes

> 1. We want to create the search recipes
> - a. Users can search recipes by title
> - b. Users can filter by time range (Ex: 5mins - 10mins, 20mins - 1 hour)
> - c. Users can filter by difficulty


Related code for this question in here [[JITERA-1] Create the search recipes](https://github.com/trantuanckc/recipes/pull/1/files)

What I did do for the question 1?

- [x] Install Elastic search
- [x] Using searchkick for Elastic search
- [x] Using Pagy for pagination (still existing the kaminari - # TODO)
- [x] Update Rspec - (simple case)
- [x] Update doorkeeper & POSTMAN API
- [x] Testing with large data (1 milion records)
<img width="883" alt="image" src="https://user-images.githubusercontent.com/4193786/179827060-fe67571b-2459-419e-a0f3-8537ef037114.png">

---

### Question 2: Weight converter, be able to convert units from one to the others

> Weight converter, be able to convert units from one to the others. Ex: Kilogram to Gram

Related code for this question in here [[JITERA-2] Create weigh converter](https://github.com/trantuanckc/recipes/pull/2/files)

What I did do for the question 2?

- [x] For this assignment, just create the simple API based on the unit GRAM to convert the weight

Or we can create a simple lib to call inside the project or rails c

```ruby 
class WeightConverter
  UNITS = {
    'cup' => 128,
    'teaspoons' =>  4.928921594,
    'kilogram' => 1000,
    'gram' => 1
  }

  def initialize(amount)
    raise StandardError.new('Invalid  amount') if amount.to_f.zero?

    @amount = amount.to_f
  end

  def method_missing(method, *args, &block)
    from, to = method.to_s.split('_to_')

    return super unless ([from, to] - UNITS.keys).empty?

    (@amount * UNITS[from]).to_f / UNITS[to].to_f
  end
end


WeightConverter.new(10).gram_to_kilogram => 0.01
WeightConverter.new(10).kilogram_to_gram => 10000.0
```

---

### Question 3: [JITERA-3] Create feature Rate for recipe

> Recipes can be rated by other users and should be able to see who has rated them. Design database and implement business logic

Related code for this question in here [[JITERA-3] Create weigh converter](https://github.com/trantuanckc/recipes/pull/3/files)

What I did do for the question 3?
- [x] User can rate the recipe, but cannot rate their own recipe
- [x] Use validation Uniq from MySQL instead of Rails
- [x] Update Rspec - (simple case)
- [x] I have created a `rates_controller.rb` separate for the expansion in the future if we want to rate to other types (only recipe for now)

---

### Question 4: [JITERA-4] Some parts of code that need to improve

> If you can find some parts of code that need to improve, please tell us and write them down as possible as you can

Related code for this question in here [[JITERA-4] Some parts of code that need to improve](https://github.com/trantuanckc/recipes/pull/5/files)

What I did do for the question 4?

- [x] N+1
- [x] Rubocop
- [x] Pagination
- [x] Fix bug related to category_id

---

## Should improve

- Update all the RSpec 
- Using the consistent response format and more information for the errors 
- Versioning the API 
- Pagination response
- Check carefully the Pundit for each controller's action
- Use gem to enhance the parse JSON
- Using consistent pagination gem 
- Scalability
- Securities (Injection Attacks, DoS Attacks, Throtlle and rate limit the API, Parameter Tampering ...)
