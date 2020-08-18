# Clean Architecture

*disclaimer, code provided in this is for illustrative purposes. It may or may not run.

Clean Architecture is the overal design of the of the project, its how the code is organised and how
these different peices relate to one another. Clean Architecture defines how we perform core functionality
and how that functionality interacts with the outside world.
 
> Clean architecture refers to organizing the project so that it's easy to understand and easy to change as the project grows. This doesn't happen by chance. It takes intentional planning.

## What does this actually look like

We split our code out into two different areas, domain and infrastructure.

### What is the domain area? 

This is code which defines your business rules.

### What is the infrastructure area

This is code which interacts with the outside world, e.g. database, http endpoint, UI

## Tour of the code base

### Entry point

 - [src/index.js - is the entry point](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/node/http/clean-architecture/src/index.js)
   - This sets things up, setting up the external services the domain area and the http server, you can see how it works a little bit like boxes. Where we create one thing and pass it into another.
 
 ### Server
 - [src/server/index.js - is how we create the server, the routes and controllers](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/node/http/clean-architecture/src/server/index.js)
 - [src/server/controllers - is where we turn a request into something the business can understand, and turn buiness reponses into something the server can understand](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/node/http/clean-architecture/src/server/controllers)
 
### The business
 - [src/account/web - is where we define the rules for the responsive web flow](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/node/http/clean-architecture/src/account/web.js)
 - [src/account/federated - is where we define the rules for the federated flow](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/node/http/clean-architecture/src/account/web.js)
 
### External I/O
- [src/services/authentication - is where we define a service in how to talk to back end](https://github.com/jakelacey2012/jakelacey2012/blob/master/languages/javascript/node/http/clean-architecture/src/services/authentication.js)

The point being here is we could change anyone of these layers and as long as we kept the API the same all would be good.

### References
 - https://pusher.com/tutorials/clean-architecture-introduction
