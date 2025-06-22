Class ecommerce.bp.sale.list.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.sale.list.Request, Output pResponse As ecommerce.bp.sale.list.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set boRequest = ##class(ecommerce.bo.sale.list.Request).%New()

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sale", boRequest, .boResponse))
		#Dim boResponse As ecommerce.bp.sale.list.Response

		Set pResponse.Sales = boResponse.Sales
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
