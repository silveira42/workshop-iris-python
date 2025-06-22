Class ecommerce.model.Product Extends (%Library.SerialObject, %JSON.Adaptor)
{

Property Name As %Library.String(%JSONFIELDNAME = "name", MAXLEN = "");

Property Description As %Library.String(%JSONFIELDNAME = "description", MAXLEN = "");

Property Sku As %Library.String(%JSONFIELDNAME = "sku", MAXLEN = "");

Property Price As %Library.Numeric(%JSONFIELDNAME = "price");

ClassMethod FromData(pData As ecommerce.data.Products) As ecommerce.model.Product
{
	Set data = pData

	Set product = ##class(ecommerce.model.Product).%New()

	Set product.Name = data.Name
	Set product.Description = data.Description
	Set product.Sku = data.Sku
	Set product.Price = data.Price

	Return product
}

Storage Default
{
<Data name="ProductState">
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Description</Value>
</Value>
<Value name="3">
<Value>Sku</Value>
</Value>
<Value name="4">
<Value>Price</Value>
</Value>
</Data>
<State>ProductState</State>
<StreamLocation>^ecommerce.model.ProductS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
