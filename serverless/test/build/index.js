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
    // Effectue la request, typiquement la seule place a modifier.
    execute() {
        return __awaiter(this, void 0, void 0, function* () {
            // TODO Add Page and skip parameters
            const data = "Hello from the base " + process.env.keycreation;
            this.send_success(this.res, data || data[0]);
        });
    }
}
const myapiservice = (req, res) => {
    const myService = new MyAPI(req, res);
    myService.perform_execute();
};
exports.myapiservice = myapiservice;
