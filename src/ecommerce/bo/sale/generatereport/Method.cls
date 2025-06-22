Include Ensemble

Class ecommerce.bo.sale.generatereport.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.sale.Operation, pRequest As ecommerce.bo.sale.generatereport.Request, Output pResponse As ecommerce.bo.sale.generatereport.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set initialDate = pRequest.InitialDate
		Set finalDate = pRequest.FinalDate

		Set report = ..GenerateReport(initialDate, finalDate)

		Set pResponse.SalesReport = report
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

ClassMethod GenerateReport(pInitialDate As %Library.String, pFinalDate As %Library.String) As ecommerce.model.SalesReport
{
	Set initialDate = pInitialDate
	Set finalDate = pFinalDate

	Set spContextServ = ##Class(%SQL.Statement).%ExecDirect(,"CALL ecommerce_data.Sales_CalculateRevenue(?, ?)", initialDate, finalDate)

	If (spContextServ.%Next())
	{
		Set report = ##class(ecommerce.model.SalesReport).%New()
		Set report.InitialDate = initialDate
		Set report.FinalDate = finalDate
		Set report.RawValue = spContextServ.%Get("RawValue")
		Set report.Discount = spContextServ.%Get("Discount")
		Set report.LiquidRevenue = spContextServ.%Get("LiquidRevenue")
		Set report.SalesQuantity = spContextServ.%Get("SalesQuantity")
		Set report.ICMS = spContextServ.%Get("ICMS")
		Set report.ISS = spContextServ.%Get("ISS")
		Return report
	}
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
