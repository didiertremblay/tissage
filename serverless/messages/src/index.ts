import { SimpleBaseService } from "./common/baseserver";

// IMPORTANT : IF YOU NEED TO MODIFY baseserver.ts or bigquery.ts you MUST TEST OTHER SERVICE AND ALIGN ALL OF THEM

class MyAPI extends SimpleBaseService {
    async execute() {
        // Look at the method and call the right function
        switch (this.req.method) {
            case "GET":
                await this.execute_get();
                break;
            case "POST":
                await this.execute_post();
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
  
    }
  
    async execute_post() {
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
  
        await this.myDB.insertDBNoBuffer(
            'messages',
            [
                // Attention à l'ordre des colonnes elle doit être identique à la table
                message,
                new Date()
            ]
        );
  
        this.send_success(this.res, { "success": true });
    }
 
    async execute_get() {
        const data = await this.myDB.queryDB(
            {
                table: 'messages',
                fields: `id, message`
            }
        );
 
        //let info_recu = [{data}];
        this.send_success(this.res, data);
    }
}

export const myapiservice = (req, res) => {
    const myService = new MyAPI(req, res, "POST,GET");
    myService.perform_execute();
}
