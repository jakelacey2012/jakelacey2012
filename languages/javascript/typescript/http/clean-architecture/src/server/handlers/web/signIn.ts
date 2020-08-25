import { Request, Response, NextFunction, Handler } from 'express';
import Joi from 'joi';

import { Web } from '../../../account/application';

function signIn(account: Web): Handler {

    const requestSchema = Joi.object().keys({
        username: Joi.string().required(),
        password: Joi.string().required(),
    })

    interface requestData {
        username: string,
        password: string,
    }

    return async function (request: Request, response: Response, next: NextFunction): Promise<void> {
        const { username, password } = request.body;

        const data: requestData = await requestSchema.validateAsync({
            username,
            password,
        });

        try {
            const token = await account.signIn(data.username, data.password);
            response.cookie('name', token)
            response.json({ok: true});
        } catch (error) {
            response.send(500).json({ok: false});
        }
    }
}

export default signIn