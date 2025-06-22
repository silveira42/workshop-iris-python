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

ClassMethod GenerateReport(pInitialDate As %Library.String, pFinalDate As %Library.String) As ecommerce.model.SalesReport [ Language = python ]
{
	import iris

	initial_date = pInitialDate
	final_date = pFinalDate

	Statement = iris._SQL.Statement
	statement = Statement._ExecDirect("", "CALL ecommerce_data.Sales_CalculateRevenue(?, ?)", initial_date, final_date)

	if statement._Next():
		SalesReport = iris.ecommerce.model.SalesReport
		report = SalesReport._New()
		report.InitialDate = initial_date
		report.FinalDate = final_date
		report.RawValue = statement._Get("RawValue")
		report.Discount = statement._Get("Discount")
		report.LiquidRevenue = statement._Get("LiquidRevenue")
		report.SalesQuantity = statement._Get("SalesQuantity")
		report.ICMS = statement._Get("ICMS")
		report.ISS = statement._Get("ISS")
		return report
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
