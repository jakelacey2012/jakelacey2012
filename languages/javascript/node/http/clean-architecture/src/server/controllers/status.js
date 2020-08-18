const statusController = (request, response, next) => {
    response.json({
        ok: true,
    })
};

export default statusController;