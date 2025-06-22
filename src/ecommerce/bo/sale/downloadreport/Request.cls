Class ecommerce.bo.sale.downloadreport.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bo.sale.downloadreport.Response";

Property SalesReport As ecommerce.model.SalesReport;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>SalesReport</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
