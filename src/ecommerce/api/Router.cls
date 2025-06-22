Class ecommerce.api.Router Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	<Map Prefix="/produto" Forward="ecommerce.api.routes.Product"/>
	<Map Prefix="/usuario" Forward="ecommerce.api.routes.User"/>
	<Map Prefix="/venda" Forward="ecommerce.api.routes.Sale"/>
</Routes>
}

ClassMethod SetResponseHeaders() [ Private ]
{
    #Dim %response As %CSP.Response

    Set %response.CharSet = "UTF-8"
    Set %response.ContentType = "applicaton/json"
}

ClassMethod OnHandleCorsRequest(pUrl As %Library.String) As %Library.Status
{
	Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Origin", "*")
	Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Credentials", "true")
	Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE, OPTIONS")
	Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Headers", "Content-Type, Authorization, Accept-Language, X-Requested-With, Token")

	Return ..HandleDefaultCorsRequest(pUrl)
}

}
