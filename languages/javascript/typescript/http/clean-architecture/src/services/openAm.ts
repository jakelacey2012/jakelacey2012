


class OpenAm {
    async authenticate(username: string, password: string): Promise<{jwt: string, session: string}> {
        return {jwt:'234', session: '1234'};
    } 
    async authorise(session: string): Promise<string> {
        return 'https://localhost?code=1234-1234-1234-1234';
    }
}

export default OpenAm;