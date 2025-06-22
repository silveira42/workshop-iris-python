Class ecommerce.dt.sale.fromSchema Extends Ens.DataTransform
{

ClassMethod Transform(pSource As ecommerce.schema.SaleCreate, Output pTarget As ecommerce.model.Sale) As %Library.Status
{
	Try
	{
		#Dim source As ecommerce.schema.SaleCreate = pSource
		Set target = ##class(ecommerce.model.Sale).%New()

		Set target.SalesDate = source.SalesDate
		Set target.RawValue = source.RawValue
		Set target.Discount = source.Discount
		Set target.ICMS = ..CalculateICMS(source.RawValue)
		Set target.ISS = ..CalculateISS(source.RawValue)

		Set pTarget = target

		Return $$$OK
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}
}

ClassMethod CalculateICMS(value As %Library.Numeric) As %Library.Numeric [ Language = python ]
{
	return value * 0.18
}

ClassMethod CalculateISS(value As %Library.Numeric) As %Library.Numeric [ Language = python ]
{
	return value * 0.05
}

}
