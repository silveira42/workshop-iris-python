Class ecommerce.bp.sales.generatereport.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.sales.generatereport.Request, Output pResponse As ecommerce.bp.sales.generatereport.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set reportRequest = ##class(ecommerce.bo.sale.generatereport.Request).%New()

		Set reportRequest.InitialDate = pRequest.InitialDate
		Set reportRequest.FinalDate = pRequest.FinalDate

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sale", reportRequest, .reportResponse))
		#Dim reportResponse As ecommerce.bo.sale.generatereport.Response

		Set pResponse.Report = reportResponse.SalesReport
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
