Class ecommerce.bp.product.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.product.create.Request, Output pResponse As ecommerce.bp.product.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set boRequest = ##class(ecommerce.bo.product.create.Request).%New()

		Set productSchema = pRequest.ProductSchema

		$$$ThrowOnError(##class(ecommerce.dt.product.fromSchema).Transform(productSchema, .productModel))

		Set boRequest.ProductModel = productModel

		$$$ThrowOnError(..SendRequestSync("Ecommerce Product", boRequest, .boResponse))
		#Dim boResponse As ecommerce.bp.product.create.Response

		Set pResponse.ProductModel = boResponse.ProductModel
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
