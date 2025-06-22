Class ecommerce.bp.product.get.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.product.get.Request, Output pResponse As ecommerce.bp.product.get.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set boRequest = ##class(ecommerce.bo.product.get.Request).%New()

		Set boRequest.Sku = pRequest.Sku

		$$$ThrowOnError(..SendRequestSync("Ecommerce Product", boRequest, .boResponse))
		#Dim boResponse As ecommerce.bp.product.get.Response

		Set pResponse.Product = boResponse.Product
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
