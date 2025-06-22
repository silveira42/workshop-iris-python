Class ecommerce.schema.ProductCreate Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Name As %Library.String(%JSONFIELDNAME = "name", MAXLEN = "");

Property Description As %Library.String(%JSONFIELDNAME = "description", MAXLEN = "");

Property Sku As %Library.String(%JSONFIELDNAME = "sku", MAXLEN = "");

Property Price As %Library.Numeric(%JSONFIELDNAME = "price");

Storage Default
{
<Data name="UserCreateState">
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Email</Value>
</Value>
<Value name="3">
<Value>Phone</Value>
</Value>
<Value name="4">
<Value>PostalCode</Value>
</Value>
<Value name="5">
<Value>Description</Value>
</Value>
<Value name="6">
<Value>Sku</Value>
</Value>
<Value name="7">
<Value>Price</Value>
</Value>
</Data>
<State>UserCreateState</State>
<StreamLocation>^ecommerce.schema.UserCreateS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
