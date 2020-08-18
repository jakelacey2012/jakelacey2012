const express = require('express');

const statusController = require('./controllers/status');
const signInController = require('./controllers/signIn')
const signInFederatedController = require('./controllers/signInFederated')

/**
 * Server definition 
 */
class Server {
    constructor(account) {
        this.app = express();

        /**
         * Routes definition
         *    
         *   Which pass the account context/domain so the controllers can interact with the business rules.
         */
        app.get('/status', statusController);
        app.post('/signin', signInController(account));
        app.post('/signin/federated', signInFederatedController(account))
    }

    start() {
        return this.app.listen(3000);
    }
}

export default Server;