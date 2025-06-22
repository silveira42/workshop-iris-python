Class ecommerce.bp.product.list.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.product.list.Request, Output pResponse As ecommerce.bp.product.list.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set boRequest = ##class(ecommerce.bo.product.list.Request).%New()

		$$$ThrowOnError(..SendRequestSync("Ecommerce Product", boRequest, .boResponse))
		#Dim boResponse As ecommerce.bp.product.list.Response

		Set pResponse.Products = boResponse.Products
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
