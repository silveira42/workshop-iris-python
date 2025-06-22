Class ecommerce.bs.product.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.product.create.Request, Output pOutput As ecommerce.bs.product.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.product.create.Request).%New()

		Set productSchema = ##class(ecommerce.schema.ProductCreate).%New()

		$$$ThrowOnError(productSchema.%JSONImport(pInput.Body))

		Set bpRequest.ProductSchema = productSchema

		$$$ThrowOnError(..SendRequestSync("Ecommerce Product Create", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.product.create.Response

		Set pOutput.ProductModel = bpResponse.ProductModel
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
