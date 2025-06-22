Class ecommerce.bp.sales.downloadreport.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.sales.downloadreport.Request, Output pResponse As ecommerce.bp.sales.downloadreport.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set reportRequest = ##class(ecommerce.bo.sale.generatereport.Request).%New()

		Set reportRequest.InitialDate = pRequest.InitialDate
		Set reportRequest.FinalDate = pRequest.FinalDate

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sale", reportRequest, .reportResponse))
		#Dim reportResponse As ecommerce.bo.sale.generatereport.Response

		Set downloadRequest = ##class(ecommerce.bo.sale.downloadreport.Request).%New()

		Set downloadRequest.SalesReport = reportResponse.SalesReport

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sale", downloadRequest, .downloadResponse))
		#Dim downloadResponse As ecommerce.bo.sale.downloadreport.Response

		Set pResponse.Report = downloadResponse.Report
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
