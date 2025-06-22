Include Ensemble

Class ecommerce.bo.sale.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.sale.Operation, pRequest As ecommerce.bo.sale.create.Request, Output pResponse As ecommerce.bo.sale.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set saleModel = pRequest.SaleModel

		Set saleData = ##class(ecommerce.data.Sales).%New()
		Set saleData.SalesDate = saleModel.SalesDate
		Set saleData.RawValue = saleModel.RawValue
		Set saleData.Discount = saleModel.Discount
		Set saleData.ICMS = saleModel.ICMS
		Set saleData.ISS = saleModel.ISS

		$$$ThrowOnError(saleData.%Save())

		Set createdSale = ##class(ecommerce.model.Sale).FromData(saleData)

		Set pResponse.SaleModel = createdSale
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
