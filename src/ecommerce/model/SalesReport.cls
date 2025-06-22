Class ecommerce.model.SalesReport Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property InitialDate As %Library.String(%JSONFIELDNAME = "initialDate");

Property FinalDate As %Library.String(%JSONFIELDNAME = "finalDate");

Property RawValue As %Library.Numeric(%JSONFIELDNAME = "rawValue");

Property Discount As %Library.Numeric(%JSONFIELDNAME = "discount");

Property LiquidRevenue As %Library.Numeric(%JSONFIELDNAME = "liquidRevenue");

Property SalesQuantity As %Library.Numeric(%JSONFIELDNAME = "quantity");

Property ICMS As %Library.Numeric(%JSONFIELDNAME = "icms");

Property ISS As %Library.Numeric(%JSONFIELDNAME = "iss");

Storage Default
{
<Data name="SalesReportState">
<Value name="1">
<Value>InitialDate</Value>
</Value>
<Value name="2">
<Value>FinalDate</Value>
</Value>
<Value name="3">
<Value>RawValue</Value>
</Value>
<Value name="4">
<Value>Discount</Value>
</Value>
<Value name="5">
<Value>LiquidRevenue</Value>
</Value>
<Value name="6">
<Value>SalesQuantity</Value>
</Value>
<Value name="7">
<Value>ICMS</Value>
</Value>
<Value name="8">
<Value>ISS</Value>
</Value>
</Data>
<State>SalesReportState</State>
<StreamLocation>^ecommerce.model.SalesReportS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
