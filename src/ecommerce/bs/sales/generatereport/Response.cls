Class ecommerce.bs.sales.generatereport.Response Extends ecommerce.bs.base.Response
{

Property Report As ecommerce.model.SalesReport(%JSONFIELDNAME = "report");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Report</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
