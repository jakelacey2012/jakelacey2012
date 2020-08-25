import express from 'express';

import status from './handlers/status';
import signIn from './handlers/web/signIn';
import signInFederated from './handlers/federated/signIn';
import { Application } from '../account/application';

class Server {

    private app: express.Application

    constructor(app: Application) {
        this.app = express();

        this.app.get('/status', status)
        this.app.post('/signin/federated', signIn(app.Web))
        this.app.post('/signin/federated', signInFederated(app.Federated))
    }

    start() {
        return this.app.listen(3000);
    }
}

export default Server;