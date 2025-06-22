Class ecommerce.model.Sale Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property SalesDate As %Library.String(%JSONFIELDNAME = "salesDate");

Property RawValue As %Library.Numeric(%JSONFIELDNAME = "rawValue");

Property Discount As %Library.Numeric(%JSONFIELDNAME = "discount");

Property ICMS As %Library.Numeric(%JSONFIELDNAME = "icms");

Property ISS As %Library.Numeric(%JSONFIELDNAME = "iss");

ClassMethod FromData(pData As ecommerce.data.Sales) As ecommerce.model.Sale
{
	Set data = pData

	Set sale = ##class(ecommerce.model.Sale).%New()

	Set sale.SalesDate = data.SalesDate
	Set sale.RawValue = data.RawValue
	Set sale.Discount = data.Discount
	Set sale.ICMS = data.ICMS
	Set sale.ISS = data.ISS

	Return sale
}

Storage Default
{
<Data name="SaleState">
<Value name="1">
<Value>SalesDate</Value>
</Value>
<Value name="2">
<Value>RawValue</Value>
</Value>
<Value name="3">
<Value>Discount</Value>
</Value>
<Value name="4">
<Value>ICMS</Value>
</Value>
<Value name="5">
<Value>ISS</Value>
</Value>
</Data>
<State>SaleState</State>
<StreamLocation>^ecommerce.model.SaleS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
