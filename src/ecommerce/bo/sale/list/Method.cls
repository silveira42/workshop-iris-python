Include Ensemble

Class ecommerce.bo.sale.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.sale.Operation, pRequest As ecommerce.bo.sale.list.Request, Output pResponse As ecommerce.bo.sale.list.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		// Query all sales from ecommerce.data.Sales
		Set statement = ##class(%SQL.Statement).%New()
		Set query = "SELECT ID, SalesDate, RawValue, Discount, ICMS, ISS FROM ecommerce_data.Sales"
		$$$ThrowOnError(statement.%Prepare(query))

		Set result = statement.%Execute()

		// Loop through results and create model objects
		While (result.%Next())
		{
			Set sale = ##class(ecommerce.model.Sale).%New()
			Set sale.SalesDate = result.%Get("SalesDate")
			Set sale.RawValue = result.%Get("RawValue")
			Set sale.Discount = result.%Get("Discount")
			Set sale.ICMS = result.%Get("ICMS")
			Set sale.ISS = result.%Get("ISS")
			Do pResponse.Sales.Insert(sale)
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
