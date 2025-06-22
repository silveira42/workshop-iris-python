Class ecommerce.bs.sales.downloadreport.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.sales.downloadreport.Request, Output pOutput As ecommerce.bs.sales.downloadreport.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.sales.downloadreport.Request).%New()

		Set bpRequest.InitialDate = pInput.InitialDate
		Set bpRequest.FinalDate = pInput.FinalDate

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sales Report Download", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.sales.downloadreport.Response

		Set pOutput.Report = bpResponse.Report
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
