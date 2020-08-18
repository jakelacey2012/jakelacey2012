
const Web = require('./account/web');
const Federated = require('./account/federated');
const Server = require('./server');
const AuthenticationService = require('./services/authentication');

/**
 * Here we define our infrastructure
 * the how we talk to the external world.
 */
const infrastructure = {
    services = {
        authentication: new AuthenticationService(),
    }
}


/**
 * Here we define the different account business context
 * and pass through infrastructure dependencies.
 */
const account = {
    web: new Web(infrastructure),
    federated: new Federated(infrastructure),
}

/**
 * Here we define our server.
 */
const server = new Server(account);
server.start();
