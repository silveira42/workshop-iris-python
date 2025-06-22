Include Ensemble

Class ecommerce.bo.product.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.product.Operation, pRequest As ecommerce.bo.product.list.Request, Output pResponse As ecommerce.bo.product.list.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		// Query all products from ecommerce.data.Products
		Set statement = ##class(%SQL.Statement).%New()
		Set query = "SELECT ID, Name, Description, Sku, Price FROM ecommerce_data.Products"
		$$$ThrowOnError(statement.%Prepare(query))

		Set result = statement.%Execute()

		// Loop through results and create model objects
		While (result.%Next())
		{
			Set product = ##class(ecommerce.model.Product).%New()
			Set product.Name = result.%Get("Name")
			Set product.Description = result.%Get("Description")
			Set product.Sku = result.%Get("Sku")
			Set product.Price = result.%Get("Price")
			Do pResponse.Products.Insert(product)
		}
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
