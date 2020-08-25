
interface Access {
    authenticate(username: string, password: string): Promise<{jwt: string, session: string}>,
    authorise(session: string): Promise<string>,
}

class Web {

    private access: Access

    constructor(access: Access) {
        this.access = access;
    }

    async signIn(username: string, password: string): Promise<string> {

        // ... here we can do extra business logic about different paramters

        const tokens = await this.access.authenticate(username, password);
        const redirectUri = await this.access.authorise(tokens.session);
        return redirectUri;
    }
}

export default Web;