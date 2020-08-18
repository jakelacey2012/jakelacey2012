
/**
 * Because this is a simple class its easy to test. Its easy because all we need to do is contruct the class
 * inject the dependencies and write the tests. Its just plain javascript, not touching the outside world making 
 * any requests or I/O
 */

class Federated {
    constructor({ services: { authentication } }) {
        this.authenticationService = authentication;
    }

    async signIn(username, password, clientId, realm, thirdPartyRedirectUri, thirdPartyState) {
        // validate username, password, clientId, realm, thirdPartyRedirectUri, thirdPartyState
        // business rules!!
        return this.authenticationService(username, password);
    }

    async register() {
        // here we can have specific federated business logic, which does exist!!
    }
}

export default Federated;