Class ecommerce.schema.SaleCreate Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property SalesDate As %Library.String(%JSONFIELDNAME = "salesDate");

Property RawValue As %Library.Numeric(%JSONFIELDNAME = "rawValue");

Property Discount As %Library.Numeric(%JSONFIELDNAME = "discount");

Storage Default
{
<Data name="SaleCreateState">
<Value name="1">
<Value>SalesDate</Value>
</Value>
<Value name="2">
<Value>RawValue</Value>
</Value>
<Value name="3">
<Value>Discount</Value>
</Value>
</Data>
<State>SaleCreateState</State>
<StreamLocation>^ecommerce.schema.SaleCreateS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
