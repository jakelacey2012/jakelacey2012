interface Web {
    signIn(username: string, password: string): Promise<string>;
}

interface Federated {
    signIn(username: string, password: string, clientId: string, realm: string, thirdPartyRedirectUri: string, thirdPartyState: string): Promise<string>;
}

interface Application {
    Web: Web,
    Federated: Federated,
}

export { Application, Web, Federated }