(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HiController;

interface

uses

    fano,
    fpjson;

type

    THiController = class(TRouteHandler, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    function THiController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var jsonObj : TJSONObject;
    begin
        jsonObj := TJSONObject.create();
        try
            jsonObj.add('Hello', 'Joko Widowo');
            result := TJsonResponse.create(response.headers(), jsonObj.asJson);
        finally
            jsonObj.free();
        end;
    end;

end.
