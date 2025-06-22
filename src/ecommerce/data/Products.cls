Class ecommerce.data.Products Extends %Library.Persistent
{

Property Name As %Library.String(MAXLEN = "");

Property Description As %Library.String(MAXLEN = "");

Property Sku As %Library.String(MAXLEN = "");

Property Price As %Library.Numeric;

Index UniqueSku On Sku [ Unique ];

Storage Default
{
<Data name="ProductsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Description</Value>
</Value>
<Value name="4">
<Value>Sku</Value>
</Value>
<Value name="5">
<Value>Price</Value>
</Value>
</Data>
<DataLocation>^ecommerce.data.ProductsD</DataLocation>
<DefaultData>ProductsDefaultData</DefaultData>
<IdLocation>^ecommerce.data.ProductsD</IdLocation>
<IndexLocation>^ecommerce.data.ProductsI</IndexLocation>
<StreamLocation>^ecommerce.data.ProductsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
