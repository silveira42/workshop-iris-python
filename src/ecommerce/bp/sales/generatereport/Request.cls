Class ecommerce.bp.sales.generatereport.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bp.sales.generatereport.Response";

Property InitialDate As %Library.String;

Property FinalDate As %Library.String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>InitialDate</Value>
</Value>
<Value name="2">
<Value>FinalDate</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
