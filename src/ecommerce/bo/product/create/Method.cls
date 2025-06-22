Include Ensemble

Class ecommerce.bo.product.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.product.Operation, pRequest As ecommerce.bo.product.create.Request, Output pResponse As ecommerce.bo.product.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set productModel = pRequest.ProductModel

		Set productData = ##class(ecommerce.data.Products).%New()
		Set productData.Name = productModel.Name
		Set productData.Description = productModel.Description
		Set productData.Sku = productModel.Sku
		Set productData.Price = productModel.Price

		$$$ThrowOnError(productData.%Save())

		Set createdProduct = ##class(ecommerce.model.Product).FromData(productData)

		Set pResponse.ProductModel = createdProduct
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
