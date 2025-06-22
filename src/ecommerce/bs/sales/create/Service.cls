Class ecommerce.bs.sale.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.sale.create.Request, Output pOutput As ecommerce.bs.sale.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.sale.create.Request).%New()

		Set saleSchema = ##class(ecommerce.schema.SaleCreate).%New()

		$$$ThrowOnError(saleSchema.%JSONImport(pInput.Body))

		Set bpRequest.SaleSchema = saleSchema

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sale Create", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.sale.create.Response

		Set pOutput.SaleModel = bpResponse.SaleModel
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
