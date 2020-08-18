
/**
 * Because this is a simple class its easy to test. Its easy because all we need to do is contruct the class
 * inject the dependencies and write the tests. Its just plain javascript, not touching the outside world making 
 * any requests or I/O
 */

class Web {
    constructor({ services: { authentication } }) {
        this.authenticationService = authentication;
    }

    async signIn(username, password) {
        // validate username, password
        // business rules!!
        return this.authenticationService(username, password);
    }

    async register() {
        // here we can have specific responsive web business logic, which does exist!!
    }
}

export default Web;