const signInFederatedController = (account) => (request, response, next) => {
    const { username, password } = request.body;
    const { clientId, realm, thirdPartyRedirectUri } = request.query;

    try {
        /**
         * Here we call out the web context very simple we
         * just delegate. Same happens in the other controller.
         */
        const tokens = await account.federated.signIn(
            username,
            password,
            clientId,
            realm,
            thirdPartyRedirectUri,
        );
        
        // here we get the tokens returned from the function and make it available
        // for the http response.
        cookie.set('name', tokens);
        return response.json({ok: false});
    } catch (error) {
        return response.send(500).json({ok: false});
    }

};

export default signInFederatedController;