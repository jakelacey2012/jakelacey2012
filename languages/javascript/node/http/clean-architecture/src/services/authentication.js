
class Authentication {
    async signIn(username, password) {
        console.log({username, password});

        // this would have specific logic in how it would "talk" 
        // to backend. How it would contruct the HTTP request or whatever.

        return {
            tokenId: '1234',
            jwt: '12341234',
        }
    }
}

export default Authentication;