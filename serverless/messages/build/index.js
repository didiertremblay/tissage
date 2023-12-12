"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.myapiservice = void 0;
const baseserver_1 = require("./common/baseserver");
// IMPORTANT : IF YOU NEED TO MODIFY baseserver.ts or bigquery.ts you MUST TEST OTHER SERVICE AND ALIGN ALL OF THEM
class MyAPI extends baseserver_1.SimpleBaseService {
    execute() {
        return __awaiter(this, void 0, void 0, function* () {
            // Look at the method and call the right function
            switch (this.req.method) {
                case "GET":
                    yield this.execute_get();
                    break;
                case "POST":
                    yield this.execute_post();
                    break;
                case "PUT":
                //await this.execute_put();
                //break;
                case "DELETE":
                //await this.execute_delete();
                //break;
                default:
                    throw ({ error: 400, msg: "Méthode non supportée" });
            }
        });
    }
    execute_post() {
        return __awaiter(this, void 0, void 0, function* () {
            // TODO faire une validation des info reçu
            let message = this.req.body.message;
            /*
            Ici je vais utiliser insertDBNoBuffer car le insert DB procède différemment et la requête est mise en attente
            await this.myDB.insertDB('messages', [
               {
                   'message': message,
                   'id': new Date().getTime()
               }
           ])
           */
            yield this.myDB.insertDBNoBuffer('messages', [
                // Attention à l'ordre des colonnes elle doit être identique à la table
                message,
                new Date()
            ]);
            this.send_success(this.res, { "success": true });
        });
    }
    execute_get() {
        return __awaiter(this, void 0, void 0, function* () {
            const data = yield this.myDB.queryDB({
                table: 'messages',
                fields: `id, message`
            });
            let info_recu = [{ data }];
            this.send_success(this.res, data);
        });
    }
}
const myapiservice = (req, res) => {
    const myService = new MyAPI(req, res, "POST,GET");
    myService.perform_execute();
};
exports.myapiservice = myapiservice;
