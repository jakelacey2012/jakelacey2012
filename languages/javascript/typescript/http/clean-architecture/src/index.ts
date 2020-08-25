import Federated from "./account/federated";
import Web from "./account/web";
import OpenAm from "./services/openAm";
import Server from "./server";

const openAm = new OpenAm();

const server = new Server({
    Web: new Web(openAm),
    Federated: new Federated(openAm),
})
server.start();