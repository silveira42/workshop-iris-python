Class ecommerce.api.routes.User Extends %CSP.REST
{

XData UrlMap
{
<Routes>
	<Route Url="" Method="POST" Call="CreateUser"/>
	<Route Url="/" Method="POST" Call="CreateUser"/>
</Routes>
}

ClassMethod CreateUser() As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/json"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce User Create", .businessService))

		Set bsRequest = ##class(ecommerce.bs.user.create.Request).%New()

		Set body = ""

		While ('%request.Content.AtEnd)
		{
			Set body = body _ $ZCONVERT(%request.Content.Read(), "I", "UTF8")
		}

		Set bsRequest.Body = body

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.user.create.Response

		Set %response.Status = ..#HTTP200OK
		Do bsResponse.%JSONExportToString(.json)
		Write json
	}
	Catch (exception)
	{
		Set body = ##class(%Library.DynamicObject).%New()
		Set body.error = ##class(%Library.DynamicObject).%New()

		If (exception.%IsA("%Exception.General"))
		{
			Set %response.Status = ##class(%CSP.REST).#HTTP400BADREQUEST
			Set body.error.code = exception.Code
			Set body.error.displayMessage = exception.Name
		}
		Else
		{
			Set %response.Status = ##class(%CSP.REST).#HTTP500INTERNALSERVERERROR
			Set body.error.code = exception.Code
			Set body.error.displayMessage = exception.Name
		}

		Set body.error.technicalMessage = exception.DisplayString()
		Set body.error.sessionId = ""
		Write body.%ToJSON()
	}

	Return $$$OK
}

}
