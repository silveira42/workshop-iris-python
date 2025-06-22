Include Ensemble

Class ecommerce.bo.product.get.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.product.Operation, pRequest As ecommerce.bo.product.get.Request, Output pResponse As ecommerce.bo.product.get.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set product = ##class(ecommerce.data.Products).UniqueSkuOpen(pRequest.Sku)

		If ('product)
		{
			Throw ##class(%Exception.General).%New("Product not found for SKU: " _ pRequest.Sku, 404)
		}

		Set foundProduct = ##class(ecommerce.model.Product).FromData(product)

		Set pResponse.Product = foundProduct
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
