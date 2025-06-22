Class ecommerce.api.routes.Product Extends %CSP.REST
{

XData UrlMap
{
<Routes>
	<Route Url="" Method="GET" Call="ListProducts"/>
	<Route Url="/" Method="GET" Call="ListProducts"/>
	<Route Url="" Method="POST" Call="CreateProduct"/>
	<Route Url="/" Method="POST" Call="CreateProduct"/>
	<Route Url="/:pId" Method="GET" Call="GetProductById"/>
</Routes>
}

ClassMethod CreateProduct() As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/json"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce Product Create", .businessService))

		Set bsRequest = ##class(ecommerce.bs.product.create.Request).%New()

		Set body = ""

		While ('%request.Content.AtEnd)
		{
			Set body = body _ $ZCONVERT(%request.Content.Read(), "I", "UTF8")
		}

		Set bsRequest.Body = body

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.product.create.Response

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

ClassMethod ListProducts() As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/json"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce Product List", .businessService))

		Set bsRequest = ##class(ecommerce.bs.product.list.Request).%New()

		Set param = ""

		For
		{
			Set param = %request.Next(param)

			If (param = "")
			{
				Quit
			}

			Set value = %request.Data(param,1)

			If (value = "")
			{
				Throw ##class(%Exception.General).%New("Invalid parameter.", 400)
			}

			If (param = "lang")
			{
				Set bsRequest.Lang = value

				Continue
			}
			Else
			{
				Throw ##class(%Exception.General).%New("Invalid parameter. You can use 'lang'.", 400)
			}
		}

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.product.list.Response

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

ClassMethod GetProductById(pId As %Library.String) As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/json"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce Product Get", .businessService))

		Set bsRequest = ##class(ecommerce.bs.product.get.Request).%New()

		Set bsRequest.Sku = pId

		Set param = ""

		For
		{
			Set param = %request.Next(param)

			If (param = "")
			{
				Quit
			}

			Set value = %request.Data(param,1)

			If (value = "")
			{
				Throw ##class(%Exception.General).%New("Invalid parameter.", 400)
			}

			If (param = "lang")
			{
				Set bsRequest.Lang = value

				Continue
			}
			Else
			{
				Throw ##class(%Exception.General).%New("Invalid parameter. You can use 'lang'.", 400)
			}
		}

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.product.get.Response

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
