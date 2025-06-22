Class ecommerce.bp.sale.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.sale.create.Request, Output pResponse As ecommerce.bp.sale.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set boRequest = ##class(ecommerce.bo.sale.create.Request).%New()

		Set saleSchema = pRequest.SaleSchema

		$$$ThrowOnError(##class(ecommerce.dt.sale.fromSchema).Transform(saleSchema, .saleModel))

		Set boRequest.SaleModel = saleModel

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sale", boRequest, .boResponse))
		#Dim boResponse As ecommerce.bp.sale.create.Response

		Set pResponse.SaleModel = boResponse.SaleModel
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
