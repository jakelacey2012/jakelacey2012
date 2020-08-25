import { Request, Response, NextFunction } from 'express';

function status(request: Request, response: Response, next: NextFunction) {
    response.json({ok: true});
}

export default status