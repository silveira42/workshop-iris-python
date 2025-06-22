Class ecommerce.bs.sales.generatereport.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.sales.generatereport.Request, Output pOutput As ecommerce.bs.sales.generatereport.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.sales.generatereport.Request).%New()

		Set bpRequest.InitialDate = pInput.InitialDate
		Set bpRequest.FinalDate = pInput.FinalDate

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sales Report Generate", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.sales.generatereport.Response

		Set pOutput.Report = bpResponse.Report
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
