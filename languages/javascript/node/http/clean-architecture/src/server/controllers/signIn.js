const signInController = (account) => (request, response, next) => {
    const { username, password } = request.body;
    try {
        /**
         * Here we call out the web context very simple we
         * just delegate. Same happens in the other controller.
         */
        const tokens = await account.web.signIn({
            username,
            password,
        });

        // here we get the tokens returned from the function and make it available
        // for the http response.
        cookie.set('name', tokens);
        return response.json({ok: false});
    } catch (error) {
        return response.send(500).json({ok: false});
    }
};

export default signInController;