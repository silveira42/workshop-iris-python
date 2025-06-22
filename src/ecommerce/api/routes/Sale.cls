Class ecommerce.api.routes.Sale Extends %CSP.REST
{

XData UrlMap
{
<Routes>
	<Route Url="" Method="POST" Call="CreateSale"/>
	<Route Url="/" Method="POST" Call="CreateSale"/>
	<Route Url="" Method="GET" Call="ListSales"/>
	<Route Url="/" Method="GET" Call="ListSales"/>
	<Route Url="/relatorio" Method="GET" Call="GetReport"/>
	<Route Url="/relatorio/download" Method="GET" Call="DownloadReport"/>
</Routes>
}

ClassMethod ListSales() As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/json"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce Sale List", .businessService))

		Set bsRequest = ##class(ecommerce.bs.sale.list.Request).%New()

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.sale.list.Response

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

ClassMethod CreateSale() As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/json"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce Sale Create", .businessService))

		Set bsRequest = ##class(ecommerce.bs.sale.create.Request).%New()

		Set body = ""

		While ('%request.Content.AtEnd)
		{
			Set body = body _ $ZCONVERT(%request.Content.Read(), "I", "UTF8")
		}

		Set bsRequest.Body = body

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.sale.create.Response

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

ClassMethod DownloadReport() As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/pdf"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce Sales Report Download", .businessService))

		Set bsRequest = ##class(ecommerce.bs.sales.downloadreport.Request).%New()

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
				Set %response.Status = ..#HTTP400BADREQUEST
				Throw ##class(%Exception.General).%New("Invalid parameter.", 400)

				Return $$$OK
			}

			If (param = "initialDate")
			{
				Set bsRequest.InitialDate = value

				Continue
			}
			ElseIf (param = "finalDate")
			{
				Set bsRequest.FinalDate = value

				Continue
			}
			Else
			{
				Set %response.Status = ..#HTTP400BADREQUEST
				Throw ##class(%Exception.General).%New("Invalid parameter. Use 'initialDate' and 'finalDate'.", 400)

				Return $$$OK
			}
		}

		If ((bsRequest.InitialDate = "") || (bsRequest.FinalDate = ""))
		{
			Set %response.Status = ..#HTTP400BADREQUEST
			Throw ##class(%Exception.General).%New("The date parameters are mandatory. Use 'initialDate' and 'finalDate'.", 400)

			Return $$$OK
		}

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.sales.downloadreport.Response

		Set %response.Status = ..#HTTP200OK
		While ('bsResponse.Report.AtEnd)
		{
			Write bsResponse.Report.Read()
		}
	}
	Catch (exception)
	{
		Set %response.ContentType = "application/json"

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

ClassMethod GetReport() As %Library.Status
{
	Try
	{
		Set %response.ContentType = "application/json"
		Set %response.CharSet = "utf-8"

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Ecommerce Sales Report Generate", .businessService))

		Set bsRequest = ##class(ecommerce.bs.sales.generatereport.Request).%New()

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
				Set %response.Status = ..#HTTP400BADREQUEST
				Throw ##class(%Exception.General).%New("Invalid parameter.", 400)

				Return $$$OK
			}

			If (param = "initialDate")
			{
				Set bsRequest.InitialDate = value

				Continue
			}
			ElseIf (param = "finalDate")
			{
				Set bsRequest.FinalDate = value

				Continue
			}
			Else
			{
				Set %response.Status = ..#HTTP400BADREQUEST
				Throw ##class(%Exception.General).%New("Invalid parameter. Use 'initialDate' and 'finalDate'.", 400)

				Return $$$OK
			}
		}

		If ((bsRequest.InitialDate = "") || (bsRequest.FinalDate = ""))
		{
			Set %response.Status = ..#HTTP400BADREQUEST
			Throw ##class(%Exception.General).%New("The date parameters are mandatory. Use 'initialDate' and 'finalDate'.", 400)

			Return $$$OK
		}

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As ecommerce.bs.sales.generatereport.Response

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
