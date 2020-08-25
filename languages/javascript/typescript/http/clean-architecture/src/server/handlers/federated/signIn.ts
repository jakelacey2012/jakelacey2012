import { Request, Response, NextFunction, Handler } from 'express';
import Joi from 'joi';

import { Federated } from '../../../account/application';

function signIn(account: Federated): Handler {

    const requestSchema = Joi.object().keys({
        username: Joi.string().required(),
        password: Joi.string().required(),
        clientId: Joi.string().required(),
        realm: Joi.string().required(),
        thirdPartyRedirectUri: Joi.string(),
        thirdPartyState: Joi.string(),
    })

    interface requestData {
        username: string,
        password: string,
        clientId: string,
        realm: string,
        thirdPartyRedirectUri: string,
        thirdPartyState: string | null,
    }

    return async function (request: Request, response: Response, next: NextFunction): Promise<void> {
        const { username, password } = request.body;
        const { clientId, realm, thirdPartyRedirectUri, thirdPartyState } = request.query;
        try {

            const data: requestData = await requestSchema.validateAsync({
                username,
                password,
                clientId,
                realm, 
                thirdPartyRedirectUri,
                thirdPartyState
            });

            const redirectUri = await account.signIn(
                data.username, 
                data.password, 
                data.clientId, 
                data.realm, 
                data.thirdPartyRedirectUri, 
                data.thirdPartyState
            );
            response.redirect(redirectUri);
        } catch (error) {
            response.send(500).json({ok: false});
        }
    }
}

export default signIn